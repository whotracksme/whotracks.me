
def testReport = 'test-report.xml'
def stagingBucket = 'internal.clyqz.com'
def stagingPrefix = '/docs/whotracksme'
def productionBucket = 'whotracksme'
def productionPrefix = ''

node('magrathea') {
    stage ('Checkout') {
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'refs/heads/'+env.BRANCH_NAME]],
            extensions: [[$class: 'GitLFSPull']],
            userRemoteConfigs: [
                [refspec: '+refs/heads/*:refs/remotes/origin/* +refs/pull/*/head:refs/remotes/origin/PR-* +refs/tags/*:refs/remotes/origin/*',
                url: 'https://github.com/cliqz-oss/whotracks.me.git']
            ]
        ])
    }
    def img

    stage('Build Docker Image') {
        img = docker.build('whotracksme', '. --build-arg user=`whoami` --build-arg UID=`id -u` --build-arg GID=`id -g`')
    }

    img.inside() {
        try {
            stage('Install') {
                sh("python -m pip install --user -e '.[dev]'")
            }

            stage('Test') {
                try {
                    sh(script: "pytest --junit-xml=${testReport}")
                } catch(err) {
                    junit(testReport)
                    currentBuild.result = "FAILURE"
                }
            }

            stage('Build site') {
                sh('/home/jenkins/.local/bin/whotracksme website')
            }

            withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            credentialsId: '	04e892d6-1f78-400e-9908-1e9466e238a9',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            ]]) {
                stage('Publish Site') {
                    def deployArgs = ''
                    if (env.BRANCH_NAME.contains('PR')) {
                        sh("python deploy_to_s3.py ${productionBucket} ${productionPrefix} --production")
                    } else if (env.TAG_NAME != null) {
                        // deployArgs = "${productionBucket} ${productionPrefix} --production"
                    } else {
                    }
                }
            }
        } finally {
            // cleanup
            sh('rm -rf _site; rm -rf .sass-cache')
        }
    }

    junit(testReport)
}
