Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 014FB1D591E
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 20:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 839AA89BAB;
	Fri, 15 May 2020 18:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Mda-F-pSk8j; Fri, 15 May 2020 18:36:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3FFCB89B9B;
	Fri, 15 May 2020 18:36:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22F69C016F;
	Fri, 15 May 2020 18:36:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEEEFC016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 18:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BB01687F19
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 18:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU1BI9HWEOcn for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 18:35:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C751B87F17
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 18:35:55 +0000 (UTC)
IronPort-SDR: c2okfAtpt3nLF/OywEVN0bObPffbEr4VqaZIQVNOiZBrhrGF8cz1iHZJvfSwlkrY1ue51b/dOw
 3jRB+Rgoi/VQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 11:35:55 -0700
IronPort-SDR: A+OFSDgkF3wuRWJQtvOYLsrPHQ9NXIpFFv7B/UPf2dehdX3Miq/ukwGHhi1bkctI0PBEg0l0DH
 bcNnFy13f/NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="342059999"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by orsmga001.jf.intel.com with ESMTP; 15 May 2020 11:35:55 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.99]) by
 ORSMSX107.amr.corp.intel.com ([169.254.1.128]) with mapi id 14.03.0439.000;
 Fri, 15 May 2020 11:35:54 -0700
From: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: RE: [PATCH] iommu: Remove functions that support private domain
Thread-Topic: [PATCH] iommu: Remove functions that support private domain
Thread-Index: AQHWKXk9fV5tekATV0S4blj7EpvL1KioBUCA///Q9SCAAIhBgP//i0rwgACMGYD//71zcAAlw0mAAANT08A=
Date: Fri, 15 May 2020 18:35:54 +0000
Message-ID: <FFF73D592F13FD46B8700F0A279B802F573A6855@ORSMSX114.amr.corp.intel.com>
References: <20200513224721.20504-1-sai.praneeth.prakhya@intel.com>
 <20200514131315.GJ18353@8bytes.org>
 <FFF73D592F13FD46B8700F0A279B802F573A6427@ORSMSX114.amr.corp.intel.com>
 <20200514183233.GO18353@8bytes.org>
 <FFF73D592F13FD46B8700F0A279B802F573A651E@ORSMSX114.amr.corp.intel.com>
 <20200514195615.GP18353@8bytes.org>
 <FFF73D592F13FD46B8700F0A279B802F573A6672@ORSMSX114.amr.corp.intel.com>
 <20200515095919.GQ18353@8bytes.org>
In-Reply-To: <20200515095919.GQ18353@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

Hi Joerg,

> -----Original Message-----
> From: Joerg Roedel <joro@8bytes.org>
> Sent: Friday, May 15, 2020 2:59 AM
> To: Prakhya, Sai Praneeth <sai.praneeth.prakhya@intel.com>
> Cc: iommu@lists.linux-foundation.org; Lu Baolu <baolu.lu@linux.intel.com>
> Subject: Re: [PATCH] iommu: Remove functions that support private domain
> 
> On Thu, May 14, 2020 at 11:12:52PM +0000, Prakhya, Sai Praneeth wrote:
> > +static int is_driver_bound(struct device *dev, void *not_used) {
> > +	int ret = 0;
> > +
> > +	device_lock(dev);
> > +	if (device_is_bound(dev))
> > +		ret = 1;
> > +	device_unlock(dev);
> > +	return ret;
> > +}
> 
> This locks only one device, so without lock-conversion there could be a driver
> probe after the device_unlock(), while we are probing the other devices of the
> group.
> 
> > [SNIP]
> >
> > +	/*
> > +	 * Check if any device in the group still has a driver binded to it.
> > +	 * This might race with device driver probing code and unfortunately
> > +	 * there is no clean way out of that either, locking all devices in the
> > +	 * group and then do the re-attach will introduce a lock-inversion with
> > +	 * group->mutex - Joerg.
> > +	 */
> > +	if (iommu_group_for_each_dev(group, NULL, is_driver_bound)) {
> > +		pr_err("Active drivers exist for devices in the group\n");
> > +		return -EBUSY;
> > +	}
> 
> The lock inversion comes into the picture when this code is called from
> device(-driver) core through the bus-notifiers. The notifiers are called with the
> device already locked.

Make sense. I will look through that code.

> > Another question I have is.. if it's racy then it should be racy even
> > for one device iommu groups.. right? Why would it be racy only with
> > multiple devices iommu group?
> 
> Valid point. So the device needs to be locked _while_ the default domain change
> happens. If triggered by sysfs there should be no locking problems, I guess. But
> you better try it out.

I will try this out and will update you.

Regards,
Sai
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
