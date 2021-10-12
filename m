Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CDF429FBC
	for <lists.iommu@lfdr.de>; Tue, 12 Oct 2021 10:26:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C98F80F1C;
	Tue, 12 Oct 2021 08:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJ1iZosbHVue; Tue, 12 Oct 2021 08:26:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3279380DE6;
	Tue, 12 Oct 2021 08:26:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AFD1C0020;
	Tue, 12 Oct 2021 08:26:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6987BC000D
 for <iommu@lists.linux-foundation.org>; Tue, 12 Oct 2021 08:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B95380DE6
 for <iommu@lists.linux-foundation.org>; Tue, 12 Oct 2021 08:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IE8YtnmXV58D for <iommu@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 08:26:12 +0000 (UTC)
X-Greylist: delayed 00:07:08 by SQLgrey-1.8.0
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5482A80DD0
 for <iommu@lists.linux-foundation.org>; Tue, 12 Oct 2021 08:26:12 +0000 (UTC)
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
 by mx.socionext.com with ESMTP; 12 Oct 2021 17:19:02 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
 by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 9506E2058B40
 for <iommu@lists.linux-foundation.org>; Tue, 12 Oct 2021 17:19:02 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP;
 Tue, 12 Oct 2021 17:19:02 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
 by kinkan2.css.socionext.com (Postfix) with ESMTP id 5438CB62B7;
 Tue, 12 Oct 2021 17:19:02 +0900 (JST)
Received: from [10.212.182.230] (unknown [10.212.182.230])
 by yuzu2.css.socionext.com (Postfix) with ESMTP id 37818B1D52;
 Tue, 12 Oct 2021 17:19:02 +0900 (JST)
To: iommu@lists.linux-foundation.org
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Question about transfer memory using DMAC belonging to IOMMU group
Message-ID: <d455497e-4eb9-005f-d3aa-7252c4e3f6b1@socionext.com>
Date: Tue, 12 Oct 2021 17:19:01 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi all,

Now I'm trying to transfer between arbitrary memories using DMAC channel
with dma_request_channel(). This transfer works fine.

However, when DMAC belongs to an IOMMU group, it fails.

I tried to transfer memory allocated from "reserved-memory" of the other device
(not IOMMU master), and it failed.

It's possible to transfer the allocated memory by calling dma_alloc_cohenrent()
with DMAC device. The dmatest is an example.

I think it's necessary to join the device associated with the reserved-memory
to the same IOMMU group as DMAC or something.

In case of using arm-smmu-v3, that will cause BUG_ON() when specifying
the same "iommus" property in devicetree as DMAC.

Are there any methods to join the device to the IOMMU group? Or transfer
arbitrary memories using DMAC belonging to the IOMMU group?

Thank you,

---
Best Regards
Kunihiko Hayashi
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
