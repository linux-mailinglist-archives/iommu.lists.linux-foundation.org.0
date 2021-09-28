Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8641AB94
	for <lists.iommu@lfdr.de>; Tue, 28 Sep 2021 11:13:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AAFC60AE3;
	Tue, 28 Sep 2021 09:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1HgGMKnRIB0; Tue, 28 Sep 2021 09:13:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AEF0260ADE;
	Tue, 28 Sep 2021 09:13:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 788D2C000D;
	Tue, 28 Sep 2021 09:13:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00F17C000D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 09:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D755740184
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 09:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPP2Ap9pmffU for <iommu@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 09:13:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5832440182
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 09:13:31 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6B747310; Tue, 28 Sep 2021 11:13:28 +0200 (CEST)
Date: Tue, 28 Sep 2021 11:13:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 0/2] iommu/ipmmu-vmsa: Add support for r8a779a0
Message-ID: <YVLcprmzOIPmujD7@8bytes.org>
References: <20210907083020.907648-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210907083020.907648-1-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, will@kernel.org
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

On Tue, Sep 07, 2021 at 05:30:18PM +0900, Yoshihiro Shimoda wrote:
> Yoshihiro Shimoda (2):
>   dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779a0 support
>   iommu/ipmmu-vmsa: Add support for r8a779a0

Applied, thanks,
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
