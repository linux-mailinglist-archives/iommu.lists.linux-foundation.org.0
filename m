Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE9D164146
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 11:16:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7A9F785E43;
	Wed, 19 Feb 2020 10:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P7VdfWIRtVmZ; Wed, 19 Feb 2020 10:16:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FB6685E40;
	Wed, 19 Feb 2020 10:16:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03C99C013E;
	Wed, 19 Feb 2020 10:16:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74FDAC013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 10:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6281785E43
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 10:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sxj6Mu5YxFzJ for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:16:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0FA4F85E40
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 10:16:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1661936A; Wed, 19 Feb 2020 11:16:14 +0100 (CET)
Date: Wed, 19 Feb 2020 11:16:12 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: Use C99 flexible array in fwspec
Message-ID: <20200219101612.GC1961@8bytes.org>
References: <7364595699c37d2ef53636c8af6dcefa6602529b.1581601149.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7364595699c37d2ef53636c8af6dcefa6602529b.1581601149.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 gustavo@embeddedor.com
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

On Thu, Feb 13, 2020 at 02:00:21PM +0000, Robin Murphy wrote:
> Although the 1-element array was a typical pre-C99 way to implement
> variable-length structures, and indeed is a fundamental construct in the
> APIs of certain other popular platforms, there's no good reason for it
> here (and in particular the sizeof() trick is far too "clever" for its
> own good). We can just as easily implement iommu_fwspec's preallocation
> behaviour using a standard flexible array member, so let's make it look
> the way most readers would expect.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Before the Coccinelle police catch up with me... :)

Applied, thanks. You should be safe now :)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
