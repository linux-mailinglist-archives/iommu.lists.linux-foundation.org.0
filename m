Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C19331954E7
	for <lists.iommu@lfdr.de>; Fri, 27 Mar 2020 11:11:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 441A4894F1;
	Fri, 27 Mar 2020 10:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNJIGRBR3UQL; Fri, 27 Mar 2020 10:11:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68209894F6;
	Fri, 27 Mar 2020 10:11:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48CC5C1D85;
	Fri, 27 Mar 2020 10:11:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B386EC0177;
 Fri, 27 Mar 2020 10:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0BF587383;
 Fri, 27 Mar 2020 10:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1tp0zTjgMJ2z; Fri, 27 Mar 2020 10:11:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5815871FD;
 Fri, 27 Mar 2020 10:11:12 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AD2522C8; Fri, 27 Mar 2020 11:11:10 +0100 (CET)
Date: Fri, 27 Mar 2020 11:11:09 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 0/3] iommu/virtio: Misc fixes
Message-ID: <20200327101109.GA3103@8bytes.org>
References: <20200326093558.2641019-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326093558.2641019-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 bbhushan2@marvell.com
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

On Thu, Mar 26, 2020 at 10:35:55AM +0100, Jean-Philippe Brucker wrote:
> A collection of fixes for the virtio-iommu driver. It might be too late
> for v5.6 since they need more review. Patch 2 is new, the others were
> posted separately. 
> 
> Jean-Philippe Brucker (3):
>   iommu/virtio: Fix sparse warning
>   iommu/virtio: Fix freeing of incomplete domains
>   iommu/virtio: Reject IOMMU page granule larger than PAGE_SIZE

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
