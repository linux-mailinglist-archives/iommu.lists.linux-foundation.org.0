Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 300735262A3
	for <lists.iommu@lfdr.de>; Fri, 13 May 2022 15:08:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C311240908;
	Fri, 13 May 2022 13:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdxJU1WBfIDS; Fri, 13 May 2022 13:08:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B3513408EC;
	Fri, 13 May 2022 13:08:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99139C002D;
	Fri, 13 May 2022 13:08:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10F76C002D
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 13:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F2D60EA8
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 13:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iF8v5pR_6zNj for <iommu@lists.linux-foundation.org>;
 Fri, 13 May 2022 13:08:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DD7C60E94
 for <iommu@lists.linux-foundation.org>; Fri, 13 May 2022 13:08:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 37AA84D2; Fri, 13 May 2022 15:08:45 +0200 (CEST)
Date: Fri, 13 May 2022 15:08:44 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu/dma: Explicitly sort PCI DMA windows
Message-ID: <Yn5YXKYg2SeWuBfT@8bytes.org>
References: <35661036a7e4160850895f9b37f35408b6a29f2f.1652091160.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35661036a7e4160850895f9b37f35408b6a29f2f.1652091160.git.robin.murphy@arm.com>
Cc: robh@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, bhelgaas@google.com, will@kernel.org
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

On Mon, May 09, 2022 at 11:16:08AM +0100, Robin Murphy wrote:
>  drivers/iommu/dma-iommu.c | 13 ++++++++++++-
>  drivers/pci/of.c          |  8 +-------
>  2 files changed, 13 insertions(+), 8 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
