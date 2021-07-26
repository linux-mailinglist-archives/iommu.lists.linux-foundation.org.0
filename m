Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BC93D59AE
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 14:43:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F822401F8;
	Mon, 26 Jul 2021 12:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIqE_ydnf8Mz; Mon, 26 Jul 2021 12:43:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 95B87401F1;
	Mon, 26 Jul 2021 12:43:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6286AC000E;
	Mon, 26 Jul 2021 12:43:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AC15C000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B1DD40363
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_b9gwjCkxKM for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 12:43:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83BF540332
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:43:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 844AB31B;
 Mon, 26 Jul 2021 05:43:30 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689D93F70D;
 Mon, 26 Jul 2021 05:43:29 -0700 (PDT)
Subject: Re: [PATCH 18/23] iommu: Express DMA strictness via the domain type
To: Lu Baolu <baolu.lu@linux.intel.com>, joro@8bytes.org, will@kernel.org
References: <cover.1626888444.git.robin.murphy@arm.com>
 <37708e21b55e17eb074ef145afc2157cd0192abe.1626888445.git.robin.murphy@arm.com>
 <f5e902ce-54a2-af7b-b42e-f61f7f96c68e@linux.intel.com>
 <77057c4b-479b-c5b8-4666-f16e294552d1@arm.com>
 <29443387-c088-480c-3d91-17b6d1cc8188@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9b5abd19-8bfe-7215-8b13-108aea2aee5e@arm.com>
Date: Mon, 26 Jul 2021 13:43:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <29443387-c088-480c-3d91-17b6d1cc8188@linux.intel.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org
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

T24gMjAyMS0wNy0yNiAxMzoyOSwgTHUgQmFvbHUgd3JvdGU6ClsuLi5dCj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaW9tbXUvZG1hLWlvbW11LmMgYi9kcml2ZXJzL2lvbW11L2RtYS1pb21tdS5j
Cj4+Pj4gaW5kZXggYjFhZjFmZjMyNGM1Li5hMTE0YTdhZDg4ZWMgMTAwNjQ0Cj4+Pj4gLS0tIGEv
ZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvZG1hLWlv
bW11LmMKPj4+PiBAQCAtMzYzLDEzICszNjMsMTUgQEAgc3RhdGljIGludCBpb21tdV9kbWFfaW5p
dF9kb21haW4oc3RydWN0IAo+Pj4+IGlvbW11X2RvbWFpbiAqZG9tYWluLCBkbWFfYWRkcl90IGJh
c2UsCj4+Pj4gwqDCoMKgwqDCoCBpbml0X2lvdmFfZG9tYWluKGlvdmFkLCAxVUwgPDwgb3JkZXIs
IGJhc2VfcGZuKTsKPj4+PiAtwqDCoMKgIGlmICghY29va2llLT5mcV9kb21haW4gJiYgIWRldl9p
c191bnRydXN0ZWQoZGV2KSAmJgo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBkb21haW4tPm9wcy0+Zmx1
c2hfaW90bGJfYWxsICYmIAo+Pj4+ICFpb21tdV9nZXRfZG1hX3N0cmljdChkb21haW4pKSB7Cj4+
Pj4gK8KgwqDCoCBpZiAoZG9tYWluLT50eXBlID09IElPTU1VX0RPTUFJTl9ETUFfRlEgJiYgIWNv
b2tpZS0+ZnFfZG9tYWluICYmCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRvbWFpbi0+b3BzLT5mbHVz
aF9pb3RsYl9hbGwpIHsKPiAKPiBQZXJoYXBzIHdlIGNhbiByZW1vdmUgdGhlIG9wcy0+Zmx1c2hf
aW90bGJfYWxsIGNoZWNrIHdpdGggdGhlCj4gYXNzdW1wdGlvbiB0aGF0IGFueSB2ZW5kb3IgaW9t
bXUgZHJpdmVyIHdpdGggRE1BX0ZRIGRvbWFpbiBzdXBwb3J0Cj4gc2hvdWxkIGFsd2F5cyBwcm92
aWRlcyB0aGlzIGNhbGxiYWNrPwoKT2ggeWVzLCBpbmRlZWQgaXQgd291bGRuJ3QgbWFrZSBzZW5z
ZSBmb3IgYSBkcml2ZXIgdG8gY2xhaW0gCklPTU1VX0RPTUFJTl9ETUFfRlEgc3VwcG9ydCBidXQg
bm90IGltcGxlbWVudCB0aGUgb25lIHRoaW5nIHRoYXQgdGhhdCAKbmVlZHMgdGhlIGRyaXZlciB0
byBwcm92aWRlLiBUaGF0J3MgeWV0IGFub3RoZXIgbmVhdCBsaXR0bGUgY2xlYW51cCwgdGhhbmtz
IQoKUm9iaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
