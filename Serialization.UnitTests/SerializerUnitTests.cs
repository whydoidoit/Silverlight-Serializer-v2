using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Serialization.UnitTests
{
    public enum Test
    {
        Zero,
        One
    }

    [TestClass]
    public class SerializerUnitTests
    {
        [TestMethod]
        public void Serializes_Deserializes_Array_Of_EnumValues()
        {
            //Arrange
            Test[] testArray = new Test[] { Test.One, Test.Zero };

            //Act
            byte[] serializedTest = SilverlightSerializer.Serialize(testArray);
            Test[] deserializedArray = (Test[])SilverlightSerializer.Deserialize(serializedTest);

            //Assert
            CollectionAssert.AreEqual(testArray, deserializedArray);
        }
    }
}
