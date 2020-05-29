Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E81E7518
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 06:46:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC61C87309;
	Fri, 29 May 2020 04:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFpev6fyzfHu; Fri, 29 May 2020 04:46:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD92387320;
	Fri, 29 May 2020 04:46:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8008C016F;
	Fri, 29 May 2020 04:46:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C02AC016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 04:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3B63F87ECF
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 04:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPKVPP2x4W00 for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 04:46:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5A58387DE1
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 04:46:40 +0000 (UTC)
IronPort-SDR: Lhlsqmzk0H+8wk38FYaBjxtN0tGGwHjPGBXWDBYv4fLSQ/Jw1MxAQJa3w7vaHJXnsPgHREzZgT
 jbsRkA4QoEVg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 21:46:39 -0700
IronPort-SDR: croZOXguAzGTjhi4A2VSsW/vCVSYoPtviGcUaTr0oPuK0oLJc/YRFBzA0sEsGKpLbjoLznYQL/
 GCDOcX61mOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; d="scan'208";a="346150228"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by orsmga001.jf.intel.com with ESMTP; 28 May 2020 21:46:39 -0700
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 28 May 2020 21:46:38 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.205]) by
 ORSMSX113.amr.corp.intel.com ([169.254.9.126]) with mapi id 14.03.0439.000;
 Thu, 28 May 2020 21:46:38 -0700
From: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH V3 0/3] iommu: Add support to change default domain of
 an iommu
Thread-Topic: [PATCH V3 0/3] iommu: Add support to change default domain of
 an iommu
Thread-Index: AQHWNSXrEZsgursdn0Cm471RCsVGr6i+woWA//+6LoA=
Date: Fri, 29 May 2020 04:46:38 +0000
Message-ID: <FFF73D592F13FD46B8700F0A279B802F573BC680@ORSMSX114.amr.corp.intel.com>
References: <cover.1590686413.git.sai.praneeth.prakhya@intel.com>
 <c863a340-906e-5040-19e7-aec5136c2a45@linux.intel.com>
In-Reply-To: <c863a340-906e-5040-19e7-aec5136c2a45@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

Hi Baolu,

> -----Original Message-----
> From: Lu Baolu <baolu.lu@linux.intel.com>
> Sent: Thursday, May 28, 2020 6:52 PM
> To: Prakhya, Sai Praneeth <sai.praneeth.prakhya@intel.com>;
> iommu@lists.linux-foundation.org
> Cc: baolu.lu@linux.intel.com; Christoph Hellwig <hch@lst.de>; Joerg Roedel
> <joro@8bytes.org>; Raj, Ashok <ashok.raj@intel.com>; Will Deacon
> <will.deacon@arm.com>; Mehta, Sohil <sohil.mehta@intel.com>; Robin
> Murphy <robin.murphy@arm.com>; Jacob Pan <jacob.jun.pan@linux.intel.com>
> Subject: Re: [PATCH V3 0/3] iommu: Add support to change default domain of
> an iommu
> 
> Hi Sai,
> 
> On 5/29/20 3:23 AM, Sai Praneeth Prakhya wrote:
> > Presently, the default domain of a iommu group is allocated during
> > boot time and it cannot be changed later. So, the device would
> > typically be either in identity
> > (pass_through) mode or the device would be in DMA mode as long as the
> > system is up and running. There is no way to change the default domain
> > type dynamically i.e. after booting, a device cannot switch between identity
> mode and DMA mode.
> >
> > Assume a use case wherein the privileged user would want to use the
> > device in pass-through mode when the device is used for host so that
> > it would be high performing. Presently, this is not supported. Hence
> > add support to change the default domain of an iommu group dynamically.
> >
> > Support this by writing to a sysfs file, namely
> > "/sys/kernel/iommu_groups/<grp_id>/type".
> 
> The email subject
> 
> [PATCH V3 0/3] iommu: Add support to change default domain of an iommu
> 
> probably should be changed to
> 
> [PATCH V3 0/3] iommu: Add support to change default domain of an iommu
> group

Oops.. my bad. I have it in the patches that I have on my dev machine. I added "group" to a new line because the subject line crossed 80 character limit. Probably, I will just put it in the same line for the next version. Thanks for bringing this up.

Regards,
Sai
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
