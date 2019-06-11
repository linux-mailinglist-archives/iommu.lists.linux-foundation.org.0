Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB33C323
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 06:56:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5C367BA9;
	Tue, 11 Jun 2019 04:56:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A6188B5F
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 04:56:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4200E63D
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 04:56:17 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jun 2019 21:56:16 -0700
X-ExtLoop1: 1
Received: from araj-mobl1.jf.intel.com ([10.254.89.212])
	by fmsmga004.fm.intel.com with ESMTP; 10 Jun 2019 21:56:15 -0700
Date: Mon, 10 Jun 2019 21:56:14 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
Subject: Re: Device specific pass through in host systems - discuss user
	interface
Message-ID: <20190611045614.GB6469@araj-mobl1.jf.intel.com>
References: <FFF73D592F13FD46B8700F0A279B802F48DA796E@ORSMSX114.amr.corp.intel.com>
	<b7a71b22-aa3b-5ac3-7285-5231f84ee979@intel.com>
	<FFF73D592F13FD46B8700F0A279B802F48DD2A02@ORSMSX114.amr.corp.intel.com>
	<20190610135617.GA27166@araj-mobl1.jf.intel.com>
	<FFF73D592F13FD46B8700F0A279B802F48DE19EC@ORSMSX114.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FFF73D592F13FD46B8700F0A279B802F48DE19EC@ORSMSX114.amr.corp.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Shankar, Ravi V" <ravi.v.shankar@intel.com>, "Tian,
	Kevin" <kevin.tian@intel.com>, "jroedel@suse.de" <jroedel@suse.de>, "Lu,
	Baolu" <baolu.lu@intel.com>, Will Deacon <will.deacon@arm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"Pan, Jacob jun" <jacob.jun.pan@intel.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"hch@lst.de" <hch@lst.de>, Ashok Raj <ashok.raj@intel.com>
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

On Mon, Jun 10, 2019 at 09:38:11PM -0700, Sai Praneeth Prakhya wrote:
> Hi All,
> 
> + Sohil and Rob Clark (as there are dropped from CC'list)
> 
> > > > Most iommu vendor drivers have switched from per-device to per-group
> > > > domain (a.k.a. default domain). So per-group pass-through mode makes
> > more sense?
> > > >
> > > > By the way, can we extend this to "per-group default domain type",
> > > > instead of only "per-group pass-through mode"? Currently we have
> > > > system level default domain type, if we have finer granularity of
> > > > default domain type, both iommu drivers and end users will benefit from it.
> > >
> > > Sure! Makes sense.. per-group default domain type sounds good.
> 
> I am planning to implement an RFC (supporting only runtime case for now) which works as below
> 
> 1. User unbinds the driver by writing to sysfs
> 2. User puts a group in pass through mode by writing "1" to
> /sys/kernel/iommu_groups/<group_id>/pt

might be better to read current value of default domain for that group.. 
/sys/kernel/iommu_groups/<group_id>/default_domain

reading the above value shows current setting.
provide a differnet file next_def_domain, and you can echo "pt" or "dma_domain"
to switch to pass-through, or normal dma isolation mode.

For devices that automatically set to pass through today like graphics, or isoch audio
you can show "pt" as default_domain.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
