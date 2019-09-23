Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DFCBBCDC
	for <lists.iommu@lfdr.de>; Mon, 23 Sep 2019 22:31:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4A48C13A6;
	Mon, 23 Sep 2019 20:31:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 67B5B13A6
	for <iommu@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 20:31:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8D7E5102
	for <iommu@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 20:31:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Sep 2019 13:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; d="scan'208";a="363749806"
Received: from araj-mobl1.jf.intel.com ([10.24.10.67])
	by orsmga005.jf.intel.com with ESMTP; 23 Sep 2019 13:31:02 -0700
Date: Mon, 23 Sep 2019 13:31:02 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [RFC PATCH 2/4] iommu/vt-d: Add first level page table interfaces
Message-ID: <20190923203102.GB21816@araj-mobl1.jf.intel.com>
References: <20190923122454.9888-1-baolu.lu@linux.intel.com>
	<20190923122454.9888-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923122454.9888-3-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, Yi Sun <yi.y.sun@linux.intel.com>,
	Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
	sanjay.k.kumar@intel.com, yi.y.sun@intel.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
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

On Mon, Sep 23, 2019 at 08:24:52PM +0800, Lu Baolu wrote:
> This adds functions to manipulate first level page tables
> which could be used by a scalale mode capable IOMMU unit.

s/scalale/scalable

> 
> intel_mmmap_range(domain, addr, end, phys_addr, prot)

Maybe think of a different name..? mmmap seems a bit weird :-)

>  - Map an iova range of [addr, end) to the physical memory
>    started at @phys_addr with the @prot permissions.
> 
> intel_mmunmap_range(domain, addr, end)
>  - Tear down the map of an iova range [addr, end). A page
>    list will be returned which will be freed after iotlb
>    flushing.
> 
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Liu Yi L <yi.l.liu@intel.com>
> Cc: Yi Sun <yi.y.sun@linux.intel.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
