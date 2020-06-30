Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 462CC20F285
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 12:19:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AD20E22836;
	Tue, 30 Jun 2020 10:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFYKSiLFWZlH; Tue, 30 Jun 2020 10:19:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 129DA2283C;
	Tue, 30 Jun 2020 10:19:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1A94C016E;
	Tue, 30 Jun 2020 10:19:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1FA9C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 90DCB88573
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5IRJBYb8P9pM for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 10:19:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9E03F88553
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:19:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71D62B0BF;
 Tue, 30 Jun 2020 10:19:22 +0000 (UTC)
Date: Tue, 30 Jun 2020 12:19:20 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Jerry Snitselaar <jsnitsel@redhat.com>
Subject: Re: [PATCH] iommu: add include/uapi/linux/iommu.h to MAINTAINERS file
Message-ID: <20200630101920.GC23790@suse.de>
References: <20200605070025.216124-1-jsnitsel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605070025.216124-1-jsnitsel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Fri, Jun 05, 2020 at 12:00:25AM -0700, Jerry Snitselaar wrote:
> When include/uapi/linux/iommu.h was created it was never
> added to the file list in MAINTAINERS.
> 
> Cc: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
