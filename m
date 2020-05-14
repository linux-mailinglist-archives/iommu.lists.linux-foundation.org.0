Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E55671D38A8
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 19:52:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70D2C87A73;
	Thu, 14 May 2020 17:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OJqkx-dsHjY; Thu, 14 May 2020 17:51:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B777487A6A;
	Thu, 14 May 2020 17:51:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4E9BC016F;
	Thu, 14 May 2020 17:51:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93937C016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 17:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6090C22721
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 17:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z754sG7RrDbl for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 17:51:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id 2F9122045D
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 17:51:47 +0000 (UTC)
IronPort-SDR: xnEkSwjxjUdeRWGoWhhD8qrz3lRSbxV/FzTsFReyjy1Xor9QKLd+At6wH2Ah1M7kCsGPa5AcRe
 q5qQ4G1dLgsw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2020 10:51:40 -0700
IronPort-SDR: ug5WrsemdTMJvaFzFshsuNz48MbVxbJ7q5R32YQFkma78Rlfjb6Tb+sLaDry43DJgR1fjGNgwq
 Var9BQ32IpaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,392,1583222400"; d="scan'208";a="252142709"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by fmsmga007.fm.intel.com with ESMTP; 14 May 2020 10:51:40 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 14 May 2020 10:51:40 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.99]) by
 ORSMSX152.amr.corp.intel.com ([169.254.8.85]) with mapi id 14.03.0439.000;
 Thu, 14 May 2020 10:51:40 -0700
From: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: RE: [PATCH] iommu: Remove functions that support private domain
Thread-Topic: [PATCH] iommu: Remove functions that support private domain
Thread-Index: AQHWKXk9fV5tekATV0S4blj7EpvL1KioBUCA///Q9SA=
Date: Thu, 14 May 2020 17:51:39 +0000
Message-ID: <FFF73D592F13FD46B8700F0A279B802F573A6427@ORSMSX114.amr.corp.intel.com>
References: <20200513224721.20504-1-sai.praneeth.prakhya@intel.com>
 <20200514131315.GJ18353@8bytes.org>
In-Reply-To: <20200514131315.GJ18353@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
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
> Sent: Thursday, May 14, 2020 6:13 AM
> To: Prakhya, Sai Praneeth <sai.praneeth.prakhya@intel.com>
> Cc: iommu@lists.linux-foundation.org; Lu Baolu <baolu.lu@linux.intel.com>
> Subject: Re: [PATCH] iommu: Remove functions that support private domain
> 
> On Wed, May 13, 2020 at 03:47:21PM -0700, Sai Praneeth Prakhya wrote:
> > After moving iommu_group setup to iommu core code [1][2] and removing
> > private domain support in vt-d [3], there are no users for functions
> > such as iommu_request_dm_for_dev(),
> iommu_request_dma_domain_for_dev()
> > and request_default_domain_for_dev(). So, remove these functions.
> 
> I thought these functions are needed for the per-group default-domain patch-
> set? That is why I left them in for now, but I can also remove them if not.

Sorry! didn't get that quite well. When you meant "per-group default-domain patch-set", do you mean the patch set that I am working on which changes iommu group default domain dynamically by writing to sysfs file?
If so, they don't use these functions so it should be ok to remove them. If you meant some other patch set, could you please point me to them?

Regards,
Sai
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
