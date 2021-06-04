Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE0339BB18
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 16:47:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4B07400E4;
	Fri,  4 Jun 2021 14:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYpQtnQ9gVsq; Fri,  4 Jun 2021 14:47:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1C7240648;
	Fri,  4 Jun 2021 14:47:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3D62C0001;
	Fri,  4 Jun 2021 14:47:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E469C0001
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 14:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 808538426E
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 14:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tsi0SN3A9_U7 for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 14:47:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 015B284267
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 14:47:34 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DBE963A9; Fri,  4 Jun 2021 16:47:30 +0200 (CEST)
Date: Fri, 4 Jun 2021 16:47:29 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Subject: Re: [PATCH] iommu/amd: Remove redundant assignment of err
Message-ID: <YLo9AWBod3ElH44I@8bytes.org>
References: <1621395447-34738-1-git-send-email-zhangshaokun@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621395447-34738-1-git-send-email-zhangshaokun@hisilicon.com>
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

On Wed, May 19, 2021 at 11:37:27AM +0800, Shaokun Zhang wrote:
> 'err' will be initialized and cleanup the redundant initialization.
> 
> Cc: Joerg Roedel <joro@8bytes.org> 
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
