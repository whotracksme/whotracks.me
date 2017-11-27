
def testReport = 'test-report.xml'
def stagingBucket = 'internal.clyqz.com'
def stagingPrefix = '/docs/whotracksme'
def productionBucket = 'cliqz-tracking-monitor'
def productionPrefix = ''

node('docker') {
    stage ('Checkout') {
        retry(5) {
            checkout scm
        }
    }
    def img

    stage('Build Docker Image') {
        img = docker.build('whotracksme', '.')
    }

    img.inside('-u 0:0') {
        try {

            stage('Install') {
                sh("pip install '.[test,website]'")
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
                sh('whotracksme website')
            }

            stage('Publish Site') {
                def deployArgs = ''
                if (env.BRANCH_NAME.contains('PR')) {
                    deployArgs = "${stagingBucket} ${stagingPrefix}/${env.BRANCH_NAME}"
                } else if (env.BRANCH_NAME == 'production') {
                    deployArgs = "${productionBucket} ${productionPrefix} --production"
                } else {
                    deployArgs = "${stagingBucket} ${stagingPrefix}/latest"
                }
                sh("python deploy_to_s3.py ${deployArgs}")
            }
        } finally {
            // cleanup
            sh('rm -rf _site; rm -rf .sass-cache')
        }
    }

    junit(testReport)
}