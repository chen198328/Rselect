﻿﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Xml.Serialization;
using XCode;
using XCode.Configuration;
using XCode.DataAccessLayer;

namespace Rselect
{
    /// <summary></summary>
    [Serializable]
    [DataObject]
    [Description("")]
    [BindIndex("PK__Subject__1BFD2C07", true, "id")]
    [BindIndex("IX_Subject_DomainId", false, "DomainId")]
    [BindRelation("id", true, "Indicator", "SubjectId")]
    [BindRelation("DomainId", false, "Domain", "id")]
    [BindTable("Subject", Description = "", ConnName = "Rselect", DbType = DatabaseType.SqlServer)]
    public partial class Subject : ISubject
    {
        #region 属性
        private Int32 _id;
        /// <summary></summary>
        [DisplayName("id")]
        [Description("")]
        [DataObjectField(true, true, false, 10)]
        [BindColumn(1, "id", "", null, "int", 10, 0, false)]
        public virtual Int32 id
        {
            get { return _id; }
            set { if (OnPropertyChanging(__.id, value)) { _id = value; OnPropertyChanged(__.id); } }
        }

        private String _Name;
        /// <summary></summary>
        [DisplayName("Name")]
        [Description("")]
        [DataObjectField(false, false, true, 500)]
        [BindColumn(2, "Name", "", null, "nvarchar(500)", 0, 0, true)]
        public virtual String Name
        {
            get { return _Name; }
            set { if (OnPropertyChanging(__.Name, value)) { _Name = value; OnPropertyChanged(__.Name); } }
        }

        private Int32 _DomainId;
        /// <summary></summary>
        [DisplayName("DomainId")]
        [Description("")]
        [DataObjectField(false, false, true, 10)]
        [BindColumn(3, "DomainId", "", null, "int", 10, 0, false)]
        public virtual Int32 DomainId
        {
            get { return _DomainId; }
            set { if (OnPropertyChanging(__.DomainId, value)) { _DomainId = value; OnPropertyChanged(__.DomainId); } }
        }

        private Int32 _ClusterId;
        /// <summary></summary>
        [DisplayName("ClusterId")]
        [Description("")]
        [DataObjectField(false, false, true, 10)]
        [BindColumn(4, "ClusterId", "", null, "int", 10, 0, false)]
        public virtual Int32 ClusterId
        {
            get { return _ClusterId; }
            set { if (OnPropertyChanging(__.ClusterId, value)) { _ClusterId = value; OnPropertyChanged(__.ClusterId); } }
        }
        #endregion

        #region 获取/设置 字段值
        /// <summary>
        /// 获取/设置 字段值。
        /// 一个索引，基类使用反射实现。
        /// 派生实体类可重写该索引，以避免反射带来的性能损耗
        /// </summary>
        /// <param name="name">字段名</param>
        /// <returns></returns>
        public override Object this[String name]
        {
            get
            {
                switch (name)
                {
                    case __.id : return _id;
                    case __.Name : return _Name;
                    case __.DomainId : return _DomainId;
                    case __.ClusterId : return _ClusterId;
                    default: return base[name];
                }
            }
            set
            {
                switch (name)
                {
                    case __.id : _id = Convert.ToInt32(value); break;
                    case __.Name : _Name = Convert.ToString(value); break;
                    case __.DomainId : _DomainId = Convert.ToInt32(value); break;
                    case __.ClusterId : _ClusterId = Convert.ToInt32(value); break;
                    default: base[name] = value; break;
                }
            }
        }
        #endregion

        #region 字段名
        /// <summary>取得字段信息的快捷方式</summary>
        public partial class _
        {
            ///<summary></summary>
            public static readonly Field id = FindByName(__.id);

            ///<summary></summary>
            public static readonly Field Name = FindByName(__.Name);

            ///<summary></summary>
            public static readonly Field DomainId = FindByName(__.DomainId);

            ///<summary></summary>
            public static readonly Field ClusterId = FindByName(__.ClusterId);

            static Field FindByName(String name) { return Meta.Table.FindByName(name); }
        }

        /// <summary>取得字段名称的快捷方式</summary>
        partial class __
        {
            ///<summary></summary>
            public const String id = "id";

            ///<summary></summary>
            public const String Name = "Name";

            ///<summary></summary>
            public const String DomainId = "DomainId";

            ///<summary></summary>
            public const String ClusterId = "ClusterId";

        }
        #endregion
    }

    /// <summary>接口</summary>
    public partial interface ISubject
    {
        #region 属性
        /// <summary></summary>
        Int32 id { get; set; }

        /// <summary></summary>
        String Name { get; set; }

        /// <summary></summary>
        Int32 DomainId { get; set; }

        /// <summary></summary>
        Int32 ClusterId { get; set; }
        #endregion

        #region 获取/设置 字段值
        /// <summary>获取/设置 字段值。</summary>
        /// <param name="name">字段名</param>
        /// <returns></returns>
        Object this[String name] { get; set; }
        #endregion
    }
}