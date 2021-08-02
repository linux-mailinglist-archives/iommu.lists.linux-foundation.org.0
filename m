Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 045C43DDAE1
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 16:23:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C3883CDC;
	Mon,  2 Aug 2021 14:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnSb6Eb1-3hL; Mon,  2 Aug 2021 14:23:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BF45583A57;
	Mon,  2 Aug 2021 14:23:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92AADC0022;
	Mon,  2 Aug 2021 14:23:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42E70C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 14:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E42D6081B
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 14:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEEdLFc_KkHj for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 14:23:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A85060817
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 14:23:17 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 417CA3C3; Mon,  2 Aug 2021 16:23:14 +0200 (CEST)
Date: Mon, 2 Aug 2021 16:23:08 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2] iommu: Check if group is NULL before remove device
Message-ID: <YQf/zKTtlV/BPTi/@8bytes.org>
References: <20210731074737.4573-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210731074737.4573-1-linux@fw-web.de>
Cc: iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>
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

On Sat, Jul 31, 2021 at 09:47:37AM +0200, Frank Wunderlich wrote:
> Fixes: d72e31c93746 ("iommu: IOMMU Groups")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - commit-message with captial letters on beginning of sentenence
> - added more information, many thanks to Yong Wu

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
