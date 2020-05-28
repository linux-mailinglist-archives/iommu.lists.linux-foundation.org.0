Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D16E1E65F8
	for <lists.iommu@lfdr.de>; Thu, 28 May 2020 17:27:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDF9F87E23;
	Thu, 28 May 2020 15:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgmwH-+plEuN; Thu, 28 May 2020 15:27:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E9D587E1F;
	Thu, 28 May 2020 15:27:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39168C016F;
	Thu, 28 May 2020 15:27:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A59EBC016F
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 15:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8E8D020354
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 15:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enPLRXHq8W95 for <iommu@lists.linux-foundation.org>;
 Thu, 28 May 2020 15:27:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id C13FF203B2
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 15:27:07 +0000 (UTC)
IronPort-SDR: ysC2b3sFPHCXXUrbtLW16dLq+w0BhhT629RiIESHcQbxL7vlpx2KVgPDdJNdFzxts0BakGxMQ8
 aydbASJOY+sg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 08:27:04 -0700
IronPort-SDR: Pv2CXIEwPZdUV7xcgp6/ptwrlHB/bbZQmzSQboT+S93LBrG9GN0YGUZ37nsLMjRz/oq0k+Sk+8
 /U6xjJBE4qUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; d="scan'208";a="469152932"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by fmsmga005.fm.intel.com with ESMTP; 28 May 2020 08:27:02 -0700
Date: Thu, 28 May 2020 08:33:20 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 0/2] iommu: Remove iommu_sva_ops::mm_exit()
Message-ID: <20200528083320.56aa5e60@jacob-builder>
In-Reply-To: <00f0597f-b235-b92e-ad41-a7ffcff9b59b@linux.intel.com>
References: <20200423125329.782066-1-jean-philippe@linaro.org>
 <20200527101038.GD265288@myrica> <20200527124240.GK5221@8bytes.org>
 <00f0597f-b235-b92e-ad41-a7ffcff9b59b@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, arnd@arndb.de,
 gregkh@linuxfoundation.org, jgg@ziepe.ca, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, linux-accelerators@lists.ozlabs.org
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

On Thu, 28 May 2020 11:32:50 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Hi Jorge,
> 
> On 2020/5/27 20:42, Joerg Roedel wrote:
> > Hi Jean-Philippe,
> > 
> > On Wed, May 27, 2020 at 12:10:38PM +0200, Jean-Philippe Brucker
> > wrote:  
> >> I was wondering if you could take these two patches for v5.8. The
> >> API change is a precursor for the SVA support in SMMUv3, and the
> >> VT-d implementation of the SVA API (queued for 5.8) doesn't
> >> implement iommu_sva_ops.  
> > 
> > I'd like some Acks on patch 2 (at least from the Intel people)
> > before going ahead with this.
> >   
> 
> Patch 2 in this series looks good to me.
> 
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> +Jacob, he participated in the discussions.
> 
Patch 2 looks good to me, VT-d has a similar flow and challenge to stop
DMA in mm_exit. We disable fault reporting during this window between
mm_exit and FD close trigged unbind.

Acked-by: Jacob Pan <jacob.jun.pan@linux.intel.com>

> Best regards,
> baolu

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
