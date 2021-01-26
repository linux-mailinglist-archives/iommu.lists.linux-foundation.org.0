Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 10957304BF9
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 23:25:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C24348522B;
	Tue, 26 Jan 2021 22:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id au9LuPOcDqcp; Tue, 26 Jan 2021 22:25:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 68D1085218;
	Tue, 26 Jan 2021 22:25:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E89BC013A;
	Tue, 26 Jan 2021 22:25:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBF7FC013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 22:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A7C5E866AF
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 22:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzeBBAUzhrrj for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 22:25:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 371918560F
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 22:25:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CEA920665;
 Tue, 26 Jan 2021 22:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611699917;
 bh=CoU9O01KVr4DWjJVSl5ku8nkaGtSHWQMM1dUjHH4D1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=twPNmo72uAXJ6QVBm5A2LBiUtuDjPMG42HhkdXLbE+weZFsQlg7VkaAwFA4q/UvFa
 86KzGPMwOveXMNXjZGo8EeZzEuTqv3F9dmQN5N/kZdl7+Cy6OJ6eg1T7fr8Lc2HRzT
 m/BGqx9FZkBz0CMw8PO+fPN2XloBzUXQD81i28Msgq+LOI1IBjommGcyKhfR0d5gj6
 JgHKSLMQ+d9OeAPsKBZI6XmdYud34aWreyxXvA/bi2EsXnbRNHVuHz44OBK01tILr0
 xYswsSiZUrXH82JPkovBHMLXRjYNTICd0RBj/4BmnVRIJx1OBOehfmdE/wSL9kPLBV
 nJQv94OUZU3zw==
Date: Tue, 26 Jan 2021 22:25:12 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 00/33] MT8192 IOMMU support
Message-ID: <20210126222511.GC30460@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Mon, Jan 11, 2021 at 07:18:41PM +0800, Yong Wu wrote:
> This patch mainly adds support for mt8192 Multimedia IOMMU and SMI.
> 
> mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> table format. The M4U-SMI HW diagram is as below:
> 
>                           EMI
>                            |
>                           M4U
>                            |
>                       ------------
>                        SMI Common
>                       ------------
>                            |
>   +-------+------+------+----------------------+-------+
>   |       |      |      |       ......         |       |
>   |       |      |      |                      |       |
> larb0   larb1  larb2  larb4     ......      larb19   larb20
> disp0   disp1   mdp    vdec                   IPE      IPE
> 
> All the connections are HW fixed, SW can NOT adjust it.
> 
> Comparing with the preview SoC, this patchset mainly adds two new functions:
> a) add iova 34 bits support.
> b) add multi domains support since several HW has the special iova
> region requirement.

This is looking good and I'd really like to see it merged, especially as it
has changes to the io-pgtable code. Please could you post a new version ASAP
to address the comments on patches 6 and 7?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
