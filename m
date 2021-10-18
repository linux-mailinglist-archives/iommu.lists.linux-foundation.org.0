Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBB0431782
	for <lists.iommu@lfdr.de>; Mon, 18 Oct 2021 13:36:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 133C0404C4;
	Mon, 18 Oct 2021 11:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82UVbV97qRAY; Mon, 18 Oct 2021 11:36:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 547A1404C1;
	Mon, 18 Oct 2021 11:36:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25A96C001E;
	Mon, 18 Oct 2021 11:36:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D443EC000D
 for <iommu@lists.linux-foundation.org>; Mon, 18 Oct 2021 11:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A27403ED
 for <iommu@lists.linux-foundation.org>; Mon, 18 Oct 2021 11:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5fP-CU50LYd for <iommu@lists.linux-foundation.org>;
 Mon, 18 Oct 2021 11:36:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 144DC400D0
 for <iommu@lists.linux-foundation.org>; Mon, 18 Oct 2021 11:36:09 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4441E450; Mon, 18 Oct 2021 13:36:06 +0200 (CEST)
Date: Mon, 18 Oct 2021 13:36:02 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] iommu/dart: use kmemdup instead of kzalloc and memcpy
Message-ID: <YW1cInsPcc/KkXJy@8bytes.org>
References: <20211013063441.29888-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013063441.29888-1-wanjiabing@vivo.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 kael_w@yeah.net, Will Deacon <will@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

On Wed, Oct 13, 2021 at 02:34:41AM -0400, Wan Jiabing wrote:
> Fix following coccicheck warning:
> drivers/iommu/apple-dart.c:704:20-27: WARNING opportunity for kmemdup
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/iommu/apple-dart.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
