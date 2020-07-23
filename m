Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946422B4FF
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 19:38:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1221788622;
	Thu, 23 Jul 2020 17:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CiS7SnMweidy; Thu, 23 Jul 2020 17:38:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C2D888627;
	Thu, 23 Jul 2020 17:38:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CDEBC004C;
	Thu, 23 Jul 2020 17:38:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA938C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 17:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C38D121517
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 17:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5t6wMLpJCeKC for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 17:38:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by silver.osuosl.org (Postfix) with ESMTPS id B024720431
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 17:38:20 +0000 (UTC)
IronPort-SDR: wvQRweAU3hONgf5icSnOS9fuBV+PWCe+8PeHViERDYzbBe6rdIy7ab23kvoL2kogQK0LZ1Re7X
 17IzL/lz41Vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="130150302"
X-IronPort-AV: E=Sophos;i="5.75,387,1589266800"; d="scan'208";a="130150302"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 10:38:20 -0700
IronPort-SDR: RAlpV8HD4DHIIAZb8EmCMWGPilcgqD0Gm+gGatQLHiZhoYs228KT/Kn2JKaqWZpDGUSfH0aBLg
 jPu0+Fu/mxNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,387,1589266800"; d="scan'208";a="462939769"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.25])
 by orsmga005.jf.intel.com with ESMTP; 23 Jul 2020 10:38:19 -0700
Date: Thu, 23 Jul 2020 10:38:19 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI/ATS: PASID and PRI are only enumerated in PF devices.
Message-ID: <20200723173819.GA345408@otc-nc-03>
References: <1595263380-209956-1-git-send-email-ashok.raj@intel.com>
 <20200721145401.GA1117318@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721145401.GA1117318@bjorn-Precision-5520>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Lu Baolu <baolu.lu@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Ashok Raj <ashok.raj@intel.com>
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

Hi Bjorn

On Tue, Jul 21, 2020 at 09:54:01AM -0500, Bjorn Helgaas wrote:
> On Mon, Jul 20, 2020 at 09:43:00AM -0700, Ashok Raj wrote:
> > PASID and PRI capabilities are only enumerated in PF devices. VF devices
> > do not enumerate these capabilites. IOMMU drivers also need to enumerate
> > them before enabling features in the IOMMU. Extending the same support as
> > PASID feature discovery (pci_pasid_features) for PRI.
> > 
> > Signed-off-by: Ashok Raj <ashok.raj@intel.com>
> 
> Hi Ashok,
> 
> When you update this for the 0-day implicit declaration thing, can you
> update the subject to say what the patch *does*, as opposed to what it
> is solving?  Also, no need for a period at the end.

Yes, will update and resend. Goofed up a couple things, i'll update those
as well.


> 
> Does this fix a regression?  Is it associated with a commit that we
> could add as a "Fixes:" tag so we know how far back to try to apply
> to stable kernels?

Yes, but the iommu files moved location and git fixes tags only generates
for a few handful of commits and doesn't show the old ones. 

Cheers,
Ashok
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
