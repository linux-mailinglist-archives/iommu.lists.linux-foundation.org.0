Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 209FF387506
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 11:25:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D1F405E6;
	Tue, 18 May 2021 09:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Hfr3ZQbH10V; Tue, 18 May 2021 09:25:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959E7405E1;
	Tue, 18 May 2021 09:25:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F510C0001;
	Tue, 18 May 2021 09:25:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52C5BC0001
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 347FF83D26
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pHPoArcq0J1 for <iommu@lists.linux-foundation.org>;
 Tue, 18 May 2021 09:25:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3D4E83D03
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:25:30 +0000 (UTC)
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fkr9Z0vcrzmjP7;
 Tue, 18 May 2021 17:21:54 +0800 (CST)
Received: from dggeme756-chm.china.huawei.com (10.3.19.102) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 17:25:22 +0800
Received: from [127.0.0.1] (10.40.193.166) by dggeme756-chm.china.huawei.com
 (10.3.19.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 18
 May 2021 17:25:22 +0800
Subject: Re: [PATCH v3] iommu/iova: put free_iova_mem() outside of spinlock
 iova_rbtree_lock
To: Joerg Roedel <joro@8bytes.org>
References: <1618816415-95649-1-git-send-email-chenxiang66@hisilicon.com>
 <YKOEHh5CECej06ah@8bytes.org>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <93b4c5c2-9443-e563-bfe6-cf89b271bfba@hisilicon.com>
Date: Tue, 18 May 2021 17:25:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <YKOEHh5CECej06ah@8bytes.org>
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Cc: will@kernel.org, iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linuxarm@openeuler.org, linuxarm@huawei.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGkgSm9lcmcsCgrlnKggMjAyMS81LzE4IDE3OjA4LCBKb2VyZyBSb2VkZWwg5YaZ6YGTOgo+IE9u
IE1vbiwgQXByIDE5LCAyMDIxIGF0IDAzOjEzOjM1UE0gKzA4MDAsIGNoZW54aWFuZyB3cm90ZToK
Pj4gRnJvbTogWGlhbmcgQ2hlbiA8Y2hlbnhpYW5nNjZAaGlzaWxpY29uLmNvbT4KPj4KPj4gSXQg
aXMgbm90IG5lY2Vzc2FyeSB0byBwdXQgZnJlZV9pb3ZhX21lbSgpIGluc2lkZSBvZiBzcGlubG9j
ay91bmxvY2sKPj4gaW92YV9yYnRyZWVfbG9jayB3aGljaCBvbmx5IGxlYWRzIHRvIG1vcmUgY29t
cGxldGlvbiBmb3IgdGhlIHNwaW5sb2NrLgo+PiBJdCBoYXMgYSBzbWFsbCBwcm9tb3RlIG9uIHRo
ZSBwZXJmb3JtYW5jZSBhZnRlciB0aGUgY2hhbmdlLiBBbmQgYWxzbwo+PiByZW5hbWUgcHJpdmF0
ZV9mcmVlX2lvdmEoKSBhcyByZW1vdmVfaW92YSgpIGJlY2F1c2UgdGhlIGZ1bmN0aW9uIHdpbGwg
bm90Cj4+IGZyZWUgaW92YSBhZnRlciB0aGF0IGNoYW5nZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
WGlhbmcgQ2hlbiA8Y2hlbnhpYW5nNjZAaGlzaWxpY29uLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy9pb21tdS9pb3ZhLmMgfCAxOCArKysrKysrKysrKy0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiBMb29rcyBnb29kIHRvIG1lLCBi
dXQgSSdsbCB3YWl0IGZvciBSb2JpbnMgb3BpbmlvbiBiZWZvcmUgYXBwbHlpbmcuCgpJIGhhdmUg
cmUtc2VudCB2MywgYW5kIFJvYmluIGhhcyBnaXZlbiBoaXMgYWNrZWQtYnk6Cmh0dHBzOi8vd3d3
Lm1haWwtYXJjaGl2ZS5jb20vaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcvbXNnNTA5
NTAuaHRtbAoKPgo+Cj4gLgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lvbW11
