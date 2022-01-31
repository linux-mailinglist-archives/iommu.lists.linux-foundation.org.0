Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DCD4A4A92
	for <lists.iommu@lfdr.de>; Mon, 31 Jan 2022 16:31:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD7860ECE;
	Mon, 31 Jan 2022 15:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDz1CEEcXBTv; Mon, 31 Jan 2022 15:31:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id ABEDC60EA9;
	Mon, 31 Jan 2022 15:31:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B071C0039;
	Mon, 31 Jan 2022 15:31:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11058C000B
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 15:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C82D040925
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 15:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OeQzE9o8Lt_X for <iommu@lists.linux-foundation.org>;
 Mon, 31 Jan 2022 15:31:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DDE840911
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 15:31:14 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 35BC04DC; Mon, 31 Jan 2022 16:31:12 +0100 (CET)
Date: Mon, 31 Jan 2022 16:31:11 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Vijayanand Jitta <quic_vjitta@quicinc.com>
Subject: Re: [REPOST PATCH v4] iommu: Fix potential use-after-free during probe
Message-ID: <YfgAv0N/iTU39Ve0@8bytes.org>
References: <1643613155-20215-1-git-send-email-quic_vjitta@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1643613155-20215-1-git-send-email-quic_vjitta@quicinc.com>
Cc: kernel-team@android.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, vjitta@codeaurora.org, will@kernel.org
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

On Mon, Jan 31, 2022 at 12:42:35PM +0530, Vijayanand Jitta wrote:
>  drivers/iommu/iommu.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied, thanks Vijayanand.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
