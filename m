Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F71F86B
	for <lists.iommu@lfdr.de>; Wed, 15 May 2019 18:22:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1F3CCC8;
	Wed, 15 May 2019 16:22:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8A212CB7
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 16:22:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 495D382C
	for <iommu@lists.linux-foundation.org>;
	Wed, 15 May 2019 16:22:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 09:22:19 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by fmsmga007.fm.intel.com with ESMTP; 15 May 2019 09:22:19 -0700
Date: Wed, 15 May 2019 09:25:13 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH v3 02/16] iommu: Introduce cache_invalidate API
Message-ID: <20190515092513.3e4a2f77@jacob-builder>
In-Reply-To: <d555d96d-a3ec-53e2-2c49-b783bb2d6806@arm.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-3-git-send-email-jacob.jun.pan@linux.intel.com>
	<d32d3d19-11c9-4af9-880b-bb8ebefd4f7f@redhat.com>
	<44d5ba37-a9e9-cc7a-2a3a-d32b840afa29@arm.com>
	<7807afe9-efab-9f48-4ca0-2332a7a54950@redhat.com>
	<1a5a5fad-ed21-5c79-9a9e-ff21fadfb95f@arm.com>
	<1edd45e6-4da3-e393-36b2-9e63cd5f7607@redhat.com>
	<4094baf1-6cf5-a33b-4717-08ced0673c50@arm.com>
	<5d2c0279-7fa9-3d11-9999-583f9ed329ba@redhat.com>
	<20190514105509.7865ebc0@jacob-builder>
	<d555d96d-a3ec-53e2-2c49-b783bb2d6806@arm.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>
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

On Wed, 15 May 2019 16:52:46 +0100
Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:

> On 14/05/2019 18:55, Jacob Pan wrote:
> > Yes, I agree to replace the standalone __64 pasid with this struct.
> > Looks more inline with address selective info., Just to double
> > confirm the new struct.
> > 
> > Jean, will you put this in your sva/api repo?  
> 
> Yes, I pushed it along with some documentation fixes (mainly getting
> rid of scripts/kernel-doc warnings and outputting valid rst)
> 
Just pulled, I am rebasing on top of this branch. If you could also
include our api for bind guest pasid, then we have a complete set of
common APIs in one place.
https://lkml.org/lkml/2019/5/3/775

I just need to add a small tweak for supporting non-identity guest-host
PASID mapping for the next version.

> Thanks,
> Jean

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
