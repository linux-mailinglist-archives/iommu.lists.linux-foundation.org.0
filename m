Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A4151CFDA
	for <lists.iommu@lfdr.de>; Fri,  6 May 2022 05:52:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 031D540222;
	Fri,  6 May 2022 03:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7sFyOjBWvo7; Fri,  6 May 2022 03:52:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F3B0440119;
	Fri,  6 May 2022 03:52:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8E5DC0081;
	Fri,  6 May 2022 03:52:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A579FC002D
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 03:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8563582F80
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 03:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VpxbE6cYecUE for <iommu@lists.linux-foundation.org>;
 Fri,  6 May 2022 03:52:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC12582F49
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 03:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651809127; x=1683345127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TQaPPOj7yVYOJi/399IE5JKkE2s6mQM3+9/tIWECYHg=;
 b=i8Hyv1gi13cJjFxKEWWzTNfhmW1Qje8SFLqDgqeontGGptrb22ylzEqP
 pmfMZJdrxBNUEIrJQMPD1RJnJLl7WWnaGjeW3/C/4fyp5LPlt7MaOwQmd
 D856uYBFDJqwcCfqGAfVK6HDRCMeqzm0YQXj3sBMJ0DOqAMaV5w9yX4/L
 jKkiktLOvlv6CCMlffcIe12h6OM3EksT0hX+zBsIMb0O0q9paRu9W11Wg
 gPQyiuDP7QUXe9vlQKzMFXlSba420BV5QnAOXderxLgNy8kIIL9P+5GLu
 XFslOUeB6cneLWCOhtiWHDtFnlDpEZCJrOemJkEt0cg+/JqxtnGYlRp7g w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248874790"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248874790"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 20:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585741726"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 05 May 2022 20:52:06 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 20:52:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 20:52:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 5 May 2022 20:52:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 5 May 2022 20:52:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEvcVXZG8MvkH0WCwKEqw+5w02761Nqmwy+p4FLgJmMPr7i7b89IRCd6Yflhkzj0zA2D0oFxwC1Q6sQ05A5xcvbxfR6JJ5sYuod4M9A3p7LwGr799l7u5PPycomyRfeZOhDQmN4q9wNi8rz1f6oDD9qdEHncfMtutP/fOLP2+chFLeaSe/RfKuj6VEObd7hlVIkZrY2WhDeMJvlDwsB0rQ4y619Hzr/sBDwa2Nc/dR5r/i9gF7KvdtcyOHAl/qdIGRiq6uDUA1EGW5u1Z1QVOW36orz78I+foQtEURWZzZsEZo4vWQSy1hhUKNnSmKlHkMs+c6a4m1VCAnQP4gNPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQaPPOj7yVYOJi/399IE5JKkE2s6mQM3+9/tIWECYHg=;
 b=lHUnM0DDyyeywA2flptcEeRUdgZpdptXwxix/elX7jspr2PdTTk4E7QXypH9ArFpWcHi6gVeRaNuL0lo3MT/j2g83oEjVH0MzZ+fdPW+ZZPgt7Pn5VgRGxWQDkFLe0QpHjM32m3RbcWq8iieLR/UELpDlZtBafJ2TEXfzzJOY/UvZqAsZTDRlaWHV8bz+DjeQys3rZ9Hz/zi01JywC3JlIzYS82EWz1IFayMk9Dv2BALbcnbPZk4ZI2iR8nrQ3WsDYpEKGMqlAJG0KYiLM7GKrh9aEeqTA9xKGoASaIn5dqVGrj+jPjxC/Snkde9pcEkc/AIwRgGFrWaapZhNXra2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 6 May
 2022 03:51:46 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 03:51:40 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH RFC 00/19] IOMMUFD Dirty Tracking
Thread-Topic: [PATCH RFC 00/19] IOMMUFD Dirty Tracking
Thread-Index: AQHYW0R/S6mfDid5yEe6M+QKFrUDn60GOWsggAB3owCAACSFgIAI+m3AgACMaACAANzWEA==
Date: Fri, 6 May 2022 03:51:40 +0000
Message-ID: <BN9PR11MB5276EACB65E108ECD4E206A38CC59@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220428210933.3583-1-joao.m.martins@oracle.com>
 <BN9PR11MB5276F104A27ACD5F20BABC7F8CFC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <f5d1a20c-df6e-36b9-c336-dc0d06af67f3@oracle.com>
 <20220429123841.GV8364@nvidia.com>
 <BN9PR11MB5276DFBF612789265199200C8CC29@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220505140736.GQ49344@nvidia.com>
In-Reply-To: <20220505140736.GQ49344@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cde743a-6882-432a-0f47-08da2f13ba59
x-ms-traffictypediagnostic: DM4PR11MB5390:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM4PR11MB539058DC1EAFD7C3162971668CC59@DM4PR11MB5390.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V4wVY1Hcz35MAH+Ivv8zc+L8x65HqfA5qX11gYjCW8CmSUl5WbgDol4V4ewrCHUJmIHAg0pyLNBojq4QL3DiZcBLZphFiCJ8f+dYDRtsnFLN5C6/6C/JGSZUVT21VQfNxuQRPy7Gu8YiUitK8NEdSDIQhUFlw5pB8kKs/s1gi/xMRoK+fRdwOhK5ZRog5FY6Kwe6vl7MYxQ/4pXVwHvAuwHzNFNf3vtBsSQl4BeYT7QxKHQf1O+0KoCf2Mqpj5OGAzQOBm+penGRTJx6ng5rqMDNEKgN0vBwCNEUUx3jy1KIxZXTxCbleY2/B/DIY/cgUERbMUdxxQn0VfK4tf/qwdNspNss2lgvQc0EeiTM95fys/SMGELunIoDM+NW0q7kDR85GjGklqp9SBCxxR2bwXSC4D79uIJJsWAoKJlrYSWd5VbtiNWSJx7IJJFp202c++/aAokTUm7xdvXeB3FJsl5h+XyrZQM0Bwbp45U5EzNa981pxaq1efePHTnGDEg3U+6d8S7YsQysSbWp1c8MpWLpv8QBr7jWEODEyirZGH5yhu6OgphRP0L/+yehXWxd5b2WH4sQhJl8UVUDpaUdYpBAonXazC7+tM/nY4jrrpsCt2spcMScUMWb8ytCU1gqyuSKGq8KhhUxNX4rsp3CLgy5SBSkkpy+daYOySAUkQfWOCGzgZIRL5ZIKzMIDwaqaUzycvU685PkBqDSxmtLZq+ReTQq/lnAgEmgUMQjDIY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(38100700002)(38070700005)(6916009)(508600001)(7696005)(316002)(33656002)(54906003)(8936002)(2906002)(82960400001)(71200400001)(66476007)(66556008)(66946007)(6506007)(66446008)(64756008)(9686003)(26005)(8676002)(76116006)(186003)(4326008)(52536014)(5660300002)(7416002)(55016003)(86362001)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/E1gLXBe6hIfWosM62J/mkiDhcYkSCZMk7W+7Lje9BYOkZNjrAFC73NWzi/c?=
 =?us-ascii?Q?rCXDblGZ3Bvsh3ExM3jn+IJHfmsw3sIiudf+7DDuGd1b1vwckO/A2OtXqIfI?=
 =?us-ascii?Q?HixSWN8ioydI6Hk4nfITqMHsY42fQNVDKQ/EnFLs5TsJVeGhP384uU7jGw7F?=
 =?us-ascii?Q?8wHP6iA2lVW9Htk1AdNVEzNpP5bzMWrGLzprY7jh6z2HHgTxYSx+/E7VAn+q?=
 =?us-ascii?Q?A/Lnu1C7X0V3Bdlh9qBvv8Eyn0QATRl+vvjyyxgiEEmWJpSa8LwkwsHtT6pP?=
 =?us-ascii?Q?a1UpkVaGhxXy7WUrEHxCNth26LZH766eFdo4NMfsnB8/qnF3+k57WFQVM3G9?=
 =?us-ascii?Q?yrsxLZm8NY3UDWzmERkv638mU8351gdWma/go5tmuLNrLPCNoroTirniQcAp?=
 =?us-ascii?Q?LJyhE9jDLTsMz63yljjya0sP14bVgCFgVkKJ8EUidmK085fCt8TfJeplY7JW?=
 =?us-ascii?Q?E8uEBgkKu3tFSbddKR0RwaQneFOu+0UGEFemoTSUlZSUNpv6tKfNX0rKvkoA?=
 =?us-ascii?Q?OqXnfF+u+BDF8weF+2NATijrdkdyCgdZ51ose5gGPacWo4ZOjY94Hqvs1Hyi?=
 =?us-ascii?Q?dq5AaNdw2XG112FJOFcYdembxgO3UaPl/4V0ehqmmO6ZWBNrQtSZS/l3C6aR?=
 =?us-ascii?Q?zWBCKN9X1MhJjgT5QWhuNx8phA28nxldKq9dGjPbS5K+V35A6C1UtHK0shrE?=
 =?us-ascii?Q?i/GgzuE3ZHn87pxflz/ZW18bslPslJGg7MxetuxUCg0FiojuahpqhvcfMqwK?=
 =?us-ascii?Q?HZJ8fkMP+NDCXF3zJwNC+YmOxjDkIsLO9WeBjiOLrZqxJyMZ6r7pKo4EHHkC?=
 =?us-ascii?Q?3mfdd7CzLkFeXA9zx6seysKG65jnQX/VlIQN4ZhPFjJh2TpCisPIPAqHeP8D?=
 =?us-ascii?Q?raioaMMEzrKrO9y7/IveZv13y1o2djru5FLzrUZgpUrhEHiSbP/BfERyYDK4?=
 =?us-ascii?Q?aw/up8oXg/sbGHHad58KbzpVeZGHus2kpVFB0RpFIMClcXLwBWIi6tlZpBcC?=
 =?us-ascii?Q?dM0rMtJgRsJ22VFSm0QyChYEsagDsbEbIbGjWpXFIFAO81NlnU+zzi8/w8rm?=
 =?us-ascii?Q?wdR+5nWf4+MuAEokJoQAiPQaMhBvNYeixUvsxUdTDZ7Na7qxKe4gFtHPy1g9?=
 =?us-ascii?Q?age8KgWAZxLs6GREWURjEBlbeBzoxbKBnRpRSSgonoMEi8tt7TdhVfjmOWnt?=
 =?us-ascii?Q?0TntVu9fzA7neIZHYhACS1fE3qcQifIjqOoNqbeQcdFUO8+Gpk70anQNfKFZ?=
 =?us-ascii?Q?i8cDaiK9EJLVAlO0w+KqcZfm866CT79U9RETZE08Agek93g4Y0TtQLmivhgS?=
 =?us-ascii?Q?BfSULyYl3X/oZPBa0tn9u3k6T4H4d2B0RX1xciYn56tljR8T6MsZpQeZdTDU?=
 =?us-ascii?Q?w/w2oh5YRAoBQl60n/CEBPgLlKAwOoPhjirFCXi7r0eHVm7iOKsIMV6CR65a?=
 =?us-ascii?Q?wsBHGUl5Ydn6sMfNL6YrH32+pUnsQ2SqSuaurPUAH+T/DljChNuB6OK8R8xL?=
 =?us-ascii?Q?tZOhIks7sEU6be/54aPUb4AHrk+zg9oEdiW0m+LBItqCRNHxQ02fOtmVZyMx?=
 =?us-ascii?Q?tRLWp2XdxyJG6NrFAyTL3hDL6h6aUGMABSSzeTd4jxHMasyy+9L3AmJc/LP6?=
 =?us-ascii?Q?Vn8glvwJ89i/ZtUSdhi/ME5Csp5cbFheI6LpxPnQVWzZXxeQ0eEPNDNCcn6m?=
 =?us-ascii?Q?31xpmbpZdvG2XYzwFnwdMbj/W+htGKXEm9rTUA59C5ov3WjxNeS453ZDDT/1?=
 =?us-ascii?Q?0SC3dNebvg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cde743a-6882-432a-0f47-08da2f13ba59
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 03:51:40.3472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqxY5ORlnnrYPAA+1B4cEa9IDbl5ericlssVONNpOr997jvyQpAivnGZ5GRMVsWnkOKP8LrNAbQl3XEH5YMMiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
X-OriginatorOrg: intel.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>, "Martins,
 Joao" <joao.m.martins@oracle.com>, David Woodhouse <dwmw2@infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, May 5, 2022 10:08 PM
> 
> On Thu, May 05, 2022 at 07:40:37AM +0000, Tian, Kevin wrote:
> 
> > In concept this is an iommu property instead of a domain property.
> 
> Not really, domains shouldn't be changing behaviors once they are
> created. If a domain supports dirty tracking and I attach a new device
> then it still must support dirty tracking.

That sort of suggests that userspace should specify whether a domain
supports dirty tracking when it's created. But how does userspace
know that it should create the domain in this way in the first place? 
live migration is triggered on demand and it may not happen in the
lifetime of a VM.

and if the user always creates domain to allow dirty tracking by default,
how does it know a failed attach is due to missing dirty tracking support
by the IOMMU and then creates another domain which disables dirty
tracking and retry-attach again?

In any case IMHO having a device capability still sounds applausive even
in above model so userspace can create domain with right property
based on a potential list of devices to be attached. Once the domain is
created, then further attached devices must be compatible to the
domain property.

> 
> I suppose we may need something here because we need to control when
> domains are re-used if they don't have the right properties in case
> the system iommu's are discontiguous somehow.
> 
> ie iommufd should be able to assert that dirty tracking is desired and
> an existing non-dirty tracking capable domain will not be
> automatically re-used.
> 
> We don't really have the right infrastructure to do this currently.
> 
> > From this angle IMHO it's more reasonable to report this IOMMU
> > property to userspace via a device capability. If all devices attached
> > to a hwpt claim IOMMU dirty tracking capability, the user can call
> > set_dirty_tracking() on the hwpt object.
> 
> Inherent domain properties need to be immutable or, at least one-way,
> like enforced coherent, or it just all stops making any kind of sense.
> 
> > Once dirty tracking is enabled on a hwpt, further attaching a device
> > which doesn't claim this capability is simply rejected.
> 
> It would be OK to do as enforced coherent does as flip a domain
> permanently into dirty-tracking enabled, or specify a flag at domain
> creation time.
> 

Either way I think a device capability is useful for the user to decide
the necessity of flipping one-way or specifying a flag at domain
creation.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
