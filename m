Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C9058312B7B
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 09:11:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8542C86734;
	Mon,  8 Feb 2021 08:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iow2DVx6edZG; Mon,  8 Feb 2021 08:11:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB67A8674A;
	Mon,  8 Feb 2021 08:11:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A108C013A;
	Mon,  8 Feb 2021 08:11:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABB62C013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 08:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8D28520027
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 08:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fp+pSn4QbEQp for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 08:11:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id EEAE32001A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 08:11:36 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E6CDD3A7; Mon,  8 Feb 2021 09:11:33 +0100 (CET)
Date: Mon, 8 Feb 2021 09:11:30 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] iommu/mediatek: Fix error code in probe()
Message-ID: <20210208081130.GA7302@8bytes.org>
References: <YB0+GU5akSdu29Vu@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YB0+GU5akSdu29Vu@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Fri, Feb 05, 2021 at 03:46:17PM +0300, Dan Carpenter wrote:
>  drivers/iommu/mtk_iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
