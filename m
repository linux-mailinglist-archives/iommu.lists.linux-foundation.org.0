Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1229CFF7
	for <lists.iommu@lfdr.de>; Mon, 26 Aug 2019 15:01:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 216051568;
	Mon, 26 Aug 2019 13:01:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E33DB1561
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 12:59:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 31F42710
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 12:59:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Aug 2019 05:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="209354171"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2019 05:59:17 -0700
Date: Mon, 26 Aug 2019 06:03:06 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu/vt-d: remove global page flush support
Message-ID: <20190826060306.6ed6faca@jacob-builder>
In-Reply-To: <20190823082307.GF30332@8bytes.org>
References: <1566336068-39416-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<20190823082307.GF30332@8bytes.org>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Raj Ashok <ashok.raj@intel.com>, LKML <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Fri, 23 Aug 2019 10:23:07 +0200
Joerg Roedel <joro@8bytes.org> wrote:

> Hi Jacob,
> 
> On Tue, Aug 20, 2019 at 02:21:08PM -0700, Jacob Pan wrote:
> > Global pages support is removed from VT-d spec 3.0. Since global
> > pages G flag only affects first-level paging structures and because
> > DMA request with PASID are only supported by VT-d spec. 3.0 and
> > onward, we can safely remove global pages support.
> > 
> > For kernel shared virtual address IOTLB invalidation, PASID
> > granularity and page selective within PASID will be used. There is
> > no global granularity supported. Without this fix, IOTLB
> > invalidation will cause invalid descriptor error in the queued
> > invalidation (QI) interface.
> > 
> > Reported-by:   Sanjay K Kumar <sanjay.k.kumar@intel.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  drivers/iommu/intel-svm.c   | 36
> > +++++++++++++++--------------------- include/linux/intel-iommu.h |
> > 3 --- 2 files changed, 15 insertions(+), 24 deletions(-)  
> 
> Does not cleanly apply to v5.3-rc5, can you please rebase it and
> re-send? Also, is this v5.3 stuff (in that case please add a Fixes
> tag) or can it wait for v5.4?
> 
I will rebase and send out again later today. Since it fixes fault in
HW and in QEMU vIOMMU that is in development, it would be great to be
included in v5.3. I will add a fixes tag.

Thanks,

Jacob

> Regards,
> 
> 	Joerg

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
