Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F403A0E12
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 09:49:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 948F340275;
	Wed,  9 Jun 2021 07:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ohUvMEjDyduC; Wed,  9 Jun 2021 07:49:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E5E9B4025B;
	Wed,  9 Jun 2021 07:49:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD89EC000B;
	Wed,  9 Jun 2021 07:49:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4F00C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C0783BE7
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ll76WpnZhzrH for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:49:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80D1483BE1
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:49:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5816036A; Wed,  9 Jun 2021 09:49:20 +0200 (CEST)
Date: Wed, 9 Jun 2021 09:49:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v8 0/4] Add IOMMU driver for rk356x
Message-ID: <YMByf1BX7cOKdZd+@8bytes.org>
References: <20210604164441.798362-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604164441.798362-1-benjamin.gaignard@collabora.com>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, will@kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, robin.murphy@arm.com,
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

On Fri, Jun 04, 2021 at 06:44:37PM +0200, Benjamin Gaignard wrote:
> This series adds the IOMMU driver for rk356x SoC.
> Since a new compatible is needed to distinguish this second version of 
> IOMMU hardware block from the first one, it is an opportunity to convert
> the binding to DT schema.
> 
> version 8:
>  - Fix compilation issue.

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
