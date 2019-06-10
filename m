Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F53B68F
	for <lists.iommu@lfdr.de>; Mon, 10 Jun 2019 15:56:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0D9AC2A;
	Mon, 10 Jun 2019 13:56:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 044C1C4E
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 13:56:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8C091775
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 13:56:20 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jun 2019 06:56:19 -0700
X-ExtLoop1: 1
Received: from dho-mobl1.amr.corp.intel.com (HELO araj-mobl1.jf.intel.com)
	([10.251.146.230])
	by fmsmga005.fm.intel.com with ESMTP; 10 Jun 2019 06:56:18 -0700
Date: Mon, 10 Jun 2019 06:56:18 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
Subject: Re: Device specific pass through in host systems - discuss user
	interface
Message-ID: <20190610135617.GA27166@araj-mobl1.jf.intel.com>
References: <FFF73D592F13FD46B8700F0A279B802F48DA796E@ORSMSX114.amr.corp.intel.com>
	<b7a71b22-aa3b-5ac3-7285-5231f84ee979@intel.com>
	<FFF73D592F13FD46B8700F0A279B802F48DD2A02@ORSMSX114.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FFF73D592F13FD46B8700F0A279B802F48DD2A02@ORSMSX114.amr.corp.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
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

Hi Sai

On Sun, Jun 09, 2019 at 10:41:10PM -0700, Sai Praneeth Prakhya wrote:
> > > I am working on an IOMMU driver feature that allows a user to specify
> > > if the DMA from a device should be translated by IOMMU or not.
> > > Presently, we support only all devices or none mode i.e. if user
> > > specifies "iommu=pt" [X86] or "iommu.passthrough" [ARM64] through
> > > kernel command line, all the devices would be in pass through mode and
> > > we don't have per device granularity, but, we were requested by a
> > > customer to selectively put devices in pass through mode and not all.
> > 
> > Most iommu vendor drivers have switched from per-device to per-group domain
> > (a.k.a. default domain). So per-group pass-through mode makes more sense?
> > 
> > By the way, can we extend this to "per-group default domain type", instead of
> > only "per-group pass-through mode"? Currently we have system level default
> > domain type, if we have finer granularity of default domain type, both iommu
> > drivers and end users will benefit from it.
> 
> Sure! Makes sense.. per-group default domain type sounds good.
> 
> > > I am looking for a consensus on **how the kernel command line argument
> > > should look like and path for sysfs entry**. Also, please note that if
> > > a device is put in pass through mode it won't be available for the
> > > guest and that's ok.
> > 
> > Just out of curiosity, what's the limitation for a device using pass- through DMA
> > domain to be assignable.
> 
> Sorry! I don't know about assignable devices. Probably, Ashok or Jacob could answer this question

We don't switch the domain for assigned devices. Only the "type" of the default domain is 
changed from dma-protected to passthrough type.

When assigning devices to user-space, there is no change in this proposal.

> 
> Regards,
> Sai
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
