Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6F51AEC49
	for <lists.iommu@lfdr.de>; Sat, 18 Apr 2020 14:02:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9E87820451;
	Sat, 18 Apr 2020 12:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwZi4MdBeW89; Sat, 18 Apr 2020 12:02:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E080B20442;
	Sat, 18 Apr 2020 12:02:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A72A5C1D89;
	Sat, 18 Apr 2020 12:02:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B497C0172
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 12:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5554087766
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 12:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uvrSzl6j2Jux for <iommu@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 12:02:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3ED8E876F4
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 12:02:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 06E11342; Sat, 18 Apr 2020 14:02:50 +0200 (CEST)
Date: Sat, 18 Apr 2020 14:02:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Kevin Hao <haokexin@gmail.com>
Subject: Re: [PATCH] iommu: Fix the memory leak in dev_iommu_free()
Message-ID: <20200418120249.GG21900@8bytes.org>
References: <20200402143749.40500-1-haokexin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402143749.40500-1-haokexin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org
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

On Thu, Apr 02, 2020 at 10:37:49PM +0800, Kevin Hao wrote:
> Fixes: 72acd9df18f1 ("iommu: Move iommu_fwspec to struct dev_iommu")
> Signed-off-by: Kevin Hao <haokexin@gmail.com>
> ---
>  drivers/iommu/iommu.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
