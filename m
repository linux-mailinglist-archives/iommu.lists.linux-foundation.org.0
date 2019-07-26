Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB175F3B
	for <lists.iommu@lfdr.de>; Fri, 26 Jul 2019 08:47:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D5DCCBA9;
	Fri, 26 Jul 2019 06:47:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4E52A3EE
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 06:47:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 07540894
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 06:47:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2019 23:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="181780760"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga002.jf.intel.com with ESMTP; 25 Jul 2019 23:47:45 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 25 Jul 2019 23:47:44 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.96]) by
	ORSMSX156.amr.corp.intel.com ([169.254.8.199]) with mapi id
	14.03.0439.000; Thu, 25 Jul 2019 23:47:44 -0700
From: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: RE: [PATCH RFC 1/4] iommu/vt-d: Modify device_def_domain_type() to
	use at runtime
Thread-Topic: [PATCH RFC 1/4] iommu/vt-d: Modify device_def_domain_type() to
	use at runtime
Thread-Index: AQHVMUKkS+N8cJMwW0Odc3chg6xB9abXUmeAgAVGROA=
Date: Fri, 26 Jul 2019 06:47:44 +0000
Message-ID: <FFF73D592F13FD46B8700F0A279B802F4F96F85C@ORSMSX114.amr.corp.intel.com>
References: <cover.1562116655.git.sai.praneeth.prakhya@intel.com>
	<f83f7a321c31e4747488c7787d53315fa25e9a31.1562116655.git.sai.praneeth.prakhya@intel.com>
	<20190722151151.GD12009@8bytes.org>
In-Reply-To: <20190722151151.GD12009@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZWI4OGYzZjktM2U4My00OTk5LWIxMzQtYTI4MmEzZjJiOTNmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUGZMOUhXZ3pXWis2RlowMHNpdmRCYXJqejRmQXhWZzh1VGEwY1dEWWZJbDJsUFJVbU1rNEc0V0xyV0F4TVwvYTUifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

> On Tue, Jul 02, 2019 at 06:53:59PM -0700, Sai Praneeth Prakhya wrote:
> > device_def_domain_type() determines the domain type a device could
> > have and it's called only during boot. But, to change the domain of a
> > group through sysfs, kernel has to call this function during runtime.
> > Hence, add an argument to the function which lets the function know if
> > it's being called at boot time or runtime.
> 
> I don't think it should make a difference when the function is actually called. The
> sysfs input is just another variable to take into account when the default domain
> type is determined.

Sure! Makes sense. I will modify the code accordingly.

> What I'd like to see for example is that I can write 'auto' to the file and get back
> the systems decision for the default domain type.

Sure! Sounds good to me. Will add this functionality.

> I'd also like to be able to forbid changing the type for e.g.  Thunderbolt connected devices.

This is presently supported in the patch set. But, I got your point, will make sure that 
untrusted devices are not allowed to change the group.

Regards,
Sai
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
