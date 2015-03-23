﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Xml.Serialization;
using XCode;
using XCode.Configuration;
using XCode.DataAccessLayer;

namespace Rselect
{
    /// <summary>Paper</summary>
    /// <remarks></remarks>
    [Serializable]
    [DataObject]
    [Description("")]
    [BindIndex("PK_Paper", true, "id")]
    [BindTable("Paper", Description = "", ConnName = "Rselect", DbType = DatabaseType.SqlServer)]
    public partial class Paper : IPaper
    {
        #region 属性
        private Int32 _id;
        /// <summary></summary>
        [DisplayName("ID")]
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
        [DataObjectField(false, false, true, 1000)]
        [BindColumn(2, "Name", "", null, "nvarchar(1000)", 0, 0, true)]
        public virtual String Name
        {
            get { return _Name; }
            set { if (OnPropertyChanging(__.Name, value)) { _Name = value; OnPropertyChanged(__.Name); } }
        }

        private Int32 _Citation;
        /// <summary></summary>
        [DisplayName("Citation")]
        [Description("")]
        [DataObjectField(false, false, true, 10)]
        [BindColumn(3, "Citation", "", null, "int", 10, 0, false)]
        public virtual Int32 Citation
        {
            get { return _Citation; }
            set { if (OnPropertyChanging(__.Citation, value)) { _Citation = value; OnPropertyChanged(__.Citation); } }
        }

        private Int32 _PId;
        /// <summary></summary>
        [DisplayName("Pid")]
        [Description("")]
        [DataObjectField(false, false, true, 10)]
        [BindColumn(4, "PId", "", null, "int", 10, 0, false)]
        public virtual Int32 PId
        {
            get { return _PId; }
            set { if (OnPropertyChanging(__.PId, value)) { _PId = value; OnPropertyChanged(__.PId); } }
        }

        private Int32 _ClusterId;
        /// <summary></summary>
        [DisplayName("ClusterId")]
        [Description("")]
        [DataObjectField(false, false, true, 10)]
        [BindColumn(5, "ClusterId", "", null, "int", 10, 0, false)]
        public virtual Int32 ClusterId
        {
            get { return _ClusterId; }
            set { if (OnPropertyChanging(__.ClusterId, value)) { _ClusterId = value; OnPropertyChanged(__.ClusterId); } }
        }

        private String _Cluster;
        /// <summary></summary>
        [DisplayName("Cluster")]
        [Description("")]
        [DataObjectField(false, false, true, 500)]
        [BindColumn(6, "Cluster", "", null, "nvarchar(500)", 0, 0, true)]
        public virtual String Cluster
        {
            get { return _Cluster; }
            set { if (OnPropertyChanging(__.Cluster, value)) { _Cluster = value; OnPropertyChanged(__.Cluster); } }
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
                    case __.Citation : return _Citation;
                    case __.PId : return _PId;
                    case __.ClusterId : return _ClusterId;
                    case __.Cluster : return _Cluster;
                    default: return base[name];
                }
            }
            set
            {
                switch (name)
                {
                    case __.id : _id = Convert.ToInt32(value); break;
                    case __.Name : _Name = Convert.ToString(value); break;
                    case __.Citation : _Citation = Convert.ToInt32(value); break;
                    case __.PId : _PId = Convert.ToInt32(value); break;
                    case __.ClusterId : _ClusterId = Convert.ToInt32(value); break;
                    case __.Cluster : _Cluster = Convert.ToString(value); break;
                    default: base[name] = value; break;
                }
            }
        }
        #endregion

        #region 字段名
        /// <summary>取得Paper字段信息的快捷方式</summary>
        public partial class _
        {
            ///<summary></summary>
            public static readonly Field id = FindByName(__.id);

            ///<summary></summary>
            public static readonly Field Name = FindByName(__.Name);

            ///<summary></summary>
            public static readonly Field Citation = FindByName(__.Citation);

            ///<summary></summary>
            public static readonly Field PId = FindByName(__.PId);

            ///<summary></summary>
            public static readonly Field ClusterId = FindByName(__.ClusterId);

            ///<summary></summary>
            public static readonly Field Cluster = FindByName(__.Cluster);

            static Field FindByName(String name) { return Meta.Table.FindByName(name); }
        }

        /// <summary>取得Paper字段名称的快捷方式</summary>
        partial class __
        {
            ///<summary></summary>
            public const String id = "id";

            ///<summary></summary>
            public const String Name = "Name";

            ///<summary></summary>
            public const String Citation = "Citation";

            ///<summary></summary>
            public const String PId = "PId";

            ///<summary></summary>
            public const String ClusterId = "ClusterId";

            ///<summary></summary>
            public const String Cluster = "Cluster";

        }
        #endregion
    }

    /// <summary>Paper接口</summary>
    /// <remarks></remarks>
    public partial interface IPaper
    {
        #region 属性
        /// <summary></summary>
        Int32 id { get; set; }

        /// <summary></summary>
        String Name { get; set; }

        /// <summary></summary>
        Int32 Citation { get; set; }

        /// <summary></summary>
        Int32 PId { get; set; }

        /// <summary></summary>
        Int32 ClusterId { get; set; }

        /// <summary></summary>
        String Cluster { get; set; }
        #endregion

        #region 获取/设置 字段值
        /// <summary>获取/设置 字段值。</summary>
        /// <param name="name">字段名</param>
        /// <returns></returns>
        Object this[String name] { get; set; }
        #endregion
    }
}