Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F73403B1
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 11:43:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8308784258;
	Thu, 18 Mar 2021 10:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hz5uvV87fga8; Thu, 18 Mar 2021 10:43:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D1284263;
	Thu, 18 Mar 2021 10:43:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CE90C0010;
	Thu, 18 Mar 2021 10:43:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8654EC0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 10:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D8C6606A5
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 10:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hXnPxHDRcZN for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:43:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D21476064D
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 10:43:05 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9A82B2D8; Thu, 18 Mar 2021 11:43:03 +0100 (CET)
Date: Thu, 18 Mar 2021 11:43:02 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v2 0/4] Misc vSVA fixes for VT-d
Message-ID: <YFMutnvP1mKhumx0@8bytes.org>
References: <1614680040-1989-1-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614680040-1989-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

On Tue, Mar 02, 2021 at 02:13:56AM -0800, Jacob Pan wrote:
> Hi Baolu et al,
> 
> This is a collection of SVA-related fixes.
> 
> ChangeLog:
> 
> v2:
> 	- For guest SVA, call pasid_set_wpe directly w/o checking host CR0.wp
> 	  (Review comments by Kevin T.)
> 	- Added fixes tag
> 
> Thanks,
> 
> Jacob
> 
> Jacob Pan (4):
>   iommu/vt-d: Enable write protect for supervisor SVM
>   iommu/vt-d: Enable write protect propagation from guest
>   iommu/vt-d: Reject unsupported page request modes
>   iommu/vt-d: Calculate and set flags for handle_mm_fault
> 
>  drivers/iommu/intel/pasid.c | 29 +++++++++++++++++++++++++++++
>  drivers/iommu/intel/svm.c   | 21 +++++++++++++++++----
>  include/uapi/linux/iommu.h  |  3 ++-
>  3 files changed, 48 insertions(+), 5 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
