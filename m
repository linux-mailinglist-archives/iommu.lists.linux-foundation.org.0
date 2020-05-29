Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC251E7E1A
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 15:12:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5446C86D80;
	Fri, 29 May 2020 13:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zG3oPTHZHFyI; Fri, 29 May 2020 13:12:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC96486D6C;
	Fri, 29 May 2020 13:12:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD57DC016F;
	Fri, 29 May 2020 13:12:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33D82C016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 13:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 052A086D80
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 13:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NezYgAdOjVbj for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 13:12:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D3B7786D6C
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 13:12:13 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C4025327; Fri, 29 May 2020 15:12:11 +0200 (CEST)
Date: Fri, 29 May 2020 15:12:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [PATCH v1 0/3] iommu/vt-d: real DMA sub-device info allocation
Message-ID: <20200529131210.GD14598@8bytes.org>
References: <20200527165617.297470-1-jonathan.derrick@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527165617.297470-1-jonathan.derrick@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On Wed, May 27, 2020 at 10:56:14AM -0600, Jon Derrick wrote:
> Jon Derrick (3):
>   iommu/vt-d: Only clear real DMA device's context entries
>   iommu/vt-d: Allocate domain info for real DMA sub-devices
>   iommu/vt-d: Remove real DMA lookup in find_domain
> 
>  drivers/iommu/intel-iommu.c | 31 +++++++++++++++++++++++--------
>  include/linux/intel-iommu.h |  1 +
>  2 files changed, 24 insertions(+), 8 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
