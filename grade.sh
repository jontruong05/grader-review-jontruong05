CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo "Java file exists"
else
    echo "Java file does not exist"
    exit
fi

cp -R student-submission/ListExamples.java grading-area
cp -R TestListExamples.java grading-area

javac grading-area/ListExamples.java 2> error.txt
if [[ !($? == 0) ]]
then
    # echo Printing error message:
    cat error.txt
    exit
fi

if [[ -f grading-area/ListExamples.class ]]
then
    echo "Class file exists"
else
    echo "Class file does not exist"
    exit
fi

# javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar 
cd grading-area
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java
java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
