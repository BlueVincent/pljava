#clone of mvn_scripts, used for the release pipeline
mvn_repo_install() {
    rm -rf ~/.m2/repository
    mkdir ~/.m2
    cp m2repository/m2repository_$1.tar.gz ~/.m2
    pushd ~/.m2
    tar zxvf m2repository_$1.tar.gz
    rm m2repository_$1.tar.gz
    popd
}

mvn_repo_save() {
    pushd ~/.m2
    # Remove build artifacts for org.postgresql.pljava
    rm -rf repository/org/postgresql
    tar zcvf m2repository_$1.tar.gz ./repository
    popd
    cp ~/.m2/m2repository_$1.tar.gz m2repository
}