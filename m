Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 655683C25B
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 06:38:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AF5ABB5F;
	Tue, 11 Jun 2019 04:38:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E85F2C
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 04:38:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1587863D
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 04:38:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jun 2019 21:38:13 -0700
X-ExtLoop1: 1
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2019 21:38:13 -0700
Received: from orsmsx162.amr.corp.intel.com (10.22.240.85) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.408.0; Mon, 10 Jun 2019 21:38:12 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.154]) by
	ORSMSX162.amr.corp.intel.com ([169.254.3.40]) with mapi id
	14.03.0415.000; Mon, 10 Jun 2019 21:38:12 -0700
From: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
To: "Raj, Ashok" <ashok.raj@intel.com>, "iommu@lists.linux-foundation.org"
	<iommu@lists.linux-foundation.org>
Subject: RE: Device specific pass through in host systems - discuss user
	interface
Thread-Topic: Device specific pass through in host systems - discuss user
	interface
Thread-Index: AdUczaahXstQhucvR3yNMqqPH3ycoQB31J8AACg+/sAAID+CAAAPfpCQ
Date: Tue, 11 Jun 2019 04:38:11 +0000
Message-ID: <FFF73D592F13FD46B8700F0A279B802F48DE19EC@ORSMSX114.amr.corp.intel.com>
References: <FFF73D592F13FD46B8700F0A279B802F48DA796E@ORSMSX114.amr.corp.intel.com>
	<b7a71b22-aa3b-5ac3-7285-5231f84ee979@intel.com>
	<FFF73D592F13FD46B8700F0A279B802F48DD2A02@ORSMSX114.amr.corp.intel.com>
	<20190610135617.GA27166@araj-mobl1.jf.intel.com>
In-Reply-To: <20190610135617.GA27166@araj-mobl1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTgxMWUyZjYtMmEyNS00MDc4LThiNTUtYTIxMzQ0ZGUyMWM3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiU2dNdnk5T0FteHVlR092Y3pxdHNhMlVLWGpxc2trUGJMKytUQ0E3OUZ0ZmNJbVwvOFwvbDdjaENhZVwveTljVFRVYiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Shankar, Ravi V" <ravi.v.shankar@intel.com>, "Tian,
	Kevin" <kevin.tian@intel.com>, "jroedel@suse.de" <jroedel@suse.de>, "Lu,
	Baolu" <baolu.lu@intel.com>, Will Deacon <will.deacon@arm.com>,
	"Pan, Jacob jun" <jacob.jun.pan@intel.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>
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

Hi All,

+ Sohil and Rob Clark (as there are dropped from CC'list)

> > > Most iommu vendor drivers have switched from per-device to per-group
> > > domain (a.k.a. default domain). So per-group pass-through mode makes
> more sense?
> > >
> > > By the way, can we extend this to "per-group default domain type",
> > > instead of only "per-group pass-through mode"? Currently we have
> > > system level default domain type, if we have finer granularity of
> > > default domain type, both iommu drivers and end users will benefit from it.
> >
> > Sure! Makes sense.. per-group default domain type sounds good.

I am planning to implement an RFC (supporting only runtime case for now) which works as below

1. User unbinds the driver by writing to sysfs
2. User puts a group in pass through mode by writing "1" to
/sys/kernel/iommu_groups/<group_id>/pt
3. User re-binds the driver by writing to sysfs

As suggested by Lu, Baolu will look into implementing this by using "per-group default domain type"

If anyone has suggestions/comments/concerns, please reply.

Regards,
Sai
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
