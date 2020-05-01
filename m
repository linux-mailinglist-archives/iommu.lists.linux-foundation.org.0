Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 811091C1186
	for <lists.iommu@lfdr.de>; Fri,  1 May 2020 13:33:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E19C871F4;
	Fri,  1 May 2020 11:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ku6n7bSwbda6; Fri,  1 May 2020 11:33:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 97AA086554;
	Fri,  1 May 2020 11:33:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 854BBC016F;
	Fri,  1 May 2020 11:33:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC1F3C016F
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 98F1225F87
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqZ9z9xqkMhj for <iommu@lists.linux-foundation.org>;
 Fri,  1 May 2020 11:33:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 06F9F25893
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 11:33:32 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3F3CA3A4; Fri,  1 May 2020 13:33:30 +0200 (CEST)
Date: Fri, 1 May 2020 13:33:28 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers/iommu: properly export iommu_group_get_for_dev
Message-ID: <20200501113328.GD18423@8bytes.org>
References: <20200430120120.2948448-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430120120.2948448-1-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, Apr 30, 2020 at 02:01:20PM +0200, Greg Kroah-Hartman wrote:
> In commit a7ba5c3d008d ("drivers/iommu: Export core IOMMU API symbols to
> permit modular drivers") a bunch of iommu symbols were exported, all
> with _GPL markings except iommu_group_get_for_dev().  That export should
> also be _GPL like the others.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: John Garry <john.garry@huawei.com>
> Fixes: a7ba5c3d008d ("drivers/iommu: Export core IOMMU API symbols to permit modular drivers")
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for v5.7, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
