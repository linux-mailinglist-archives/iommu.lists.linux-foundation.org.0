Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD725D893
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 14:27:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F64C87321;
	Fri,  4 Sep 2020 12:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyIX-K+syw09; Fri,  4 Sep 2020 12:27:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A00F587317;
	Fri,  4 Sep 2020 12:27:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86A27C0051;
	Fri,  4 Sep 2020 12:27:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4044C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 12:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A95DF87306
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 12:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtWJFJNoupgv for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 12:27:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D4481872E9
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 12:27:35 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904122732euoutp014d194639cc802121a1d04c59bf378069~xlFkRQ5Py1367913679euoutp01L
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 12:27:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904122732euoutp014d194639cc802121a1d04c59bf378069~xlFkRQ5Py1367913679euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599222452;
 bh=tdB0xJYiSpTmY+yS8kf5mZPVCvh6k64z90bTTJ9+2Gk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=aUJ6JE3GbU0LDfw0Vh8NL0zJuGUp/Gkb4ZDoqZUX9Yg4y6kGKm2gxi7pprcFHdQ3E
 VUeyYRCEsOdGQCjGK6H1aaaebobPbVB3eR5f8eBULMhlg1VlyA6qxHPjP3+8vXQ6GA
 lZxgWhZbYRo0XRXonOE8CE+njCasnNWGLdUWmD9s=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904122732eucas1p115d52aac35c0031ffd76584c3c87a8ad~xlFjlRYKd2359523595eucas1p1w;
 Fri,  4 Sep 2020 12:27:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 3C.2C.05997.4B2325F5; Fri,  4
 Sep 2020 13:27:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904122731eucas1p180b68e5a1dc7e6e7de9013f74fdc12f5~xlFjQyAY42360023600eucas1p16;
 Fri,  4 Sep 2020 12:27:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904122731eusmtrp26ac2db7190b441c18107c680224dc581~xlFjQC1mH3222832228eusmtrp2u;
 Fri,  4 Sep 2020 12:27:31 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-96-5f5232b4e408
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5E.F4.06314.3B2325F5; Fri,  4
 Sep 2020 13:27:31 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200904122731eusmtip225af98693c912cb6279e2dbb2e3a764f~xlFioM5OW1419314193eusmtip2E;
 Fri,  4 Sep 2020 12:27:31 +0000 (GMT)
Subject: Re: [PATCH v9 14/32] drm: omapdrm: fix common struct sg_table
 related issues
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Robin Murphy
 <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <ee9f6526-3050-9624-f9ba-e39bacceb19e@samsung.com>
Date: Fri, 4 Sep 2020 14:27:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c3173e34-7d78-4f39-8a64-bbbd4814b3c0@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjtt3t3d6fO7mblh0nBCKMo0+qPS4pp+MeFCCSil/i45U2tbdqm
 mUEpTUqnPSwsnT3MLLWWSzMfk16rHDYalhrLijIlLVqLnGYxMrer5X/nnO8cvvPBR2KyEWEQ
 ma7K4tQqViEnfPCWzl+2lc2rNyeF1VvF9Albl4BuLDcK6cmWUozuHXMSdP3NpwK66kEEXVRa
 I6JdvQMCumnwlZDuMV0g6Effh4S08XI/Ee3HGC4ZEHNvvApnKgsrhEzr+Ach877YImDu1OQx
 b/4MYsxZey1iOl7nE8zJ5huIsdhbBcxo06I4v50+kSmcIv0Ap14VleyTVjrkRJk3Qw6O3m/C
 8lHBYh0Sk0CthdtXT2E65EPKqDoE7uE+EU9cCN46rkxPRhG8u+7EZiI9xy/i/KAWwe1rIwKe
 OBGU/azBPa4AahtUNX73JggqHHQOHeExzaNeIbg/YfASjHIjKC75jDwuCRUFxZXnRB6MU0vg
 m7nOq8+nEqHz2Uec90ihq2LIi8XUenBXPiE8GKMWg/ZuJcbjQOgfuuytBFQRCRPdfdPFY+F3
 RRHB4wD4YmkW8TgYJttnAloEA7ZbIp6UIOg5Wo54VwS8tf2eSpNTK5aB0bSKl2Og2nJF5JGB
 8ge7Q8qX8IczLecxXpZA4TEZ7w4BvaXh39pH3S+x00iun3WaftY5+lnn6P/vrUL4DRTIZWuU
 qZxmtYrLCdWwSk22KjV0d4ayCU39n/WPxdWGTO5dZkSRSO4nsTvjkmRC9oAmV2lGQGLyeZIN
 z62JMkkKm3uIU2ckqbMVnMaMFpK4PFCypvpzgoxKZbO4fRyXyalnpgJSHJSPEgo2bm9XfYuP
 aXGQbgO7JSdSq+ivy1zXmBESnfhpbLjMKO3O6NrqziksWPiwd/+KTdIg7eGsbWWRMZac6OFy
 l3/omPZFfIT43FJrpqlPujdK9bgtWKhsc7hdhxUPLHMXrJXt2nHXt+JrrK9uMm/P7jnJp9Js
 Rxo68n6k14f5xmFyXJPGhi/H1Br2L6jrpoF7AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRmVeSWpSXmKPExsVy+t/xe7qbjYLiDea2Gln0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbdE5cwm7x5cpDJotNj6+xWlzeNYfN4uCHJ6wW6+ffYnPg
 8Vgzbw2jx95vC1g8ZnfMZPXY/u0Bq8f97uNMHpuX1Hvc/veY2WPyjeWMHrtvNrB59G1Zxehx
 /MZ2Jo/Pm+QCeKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
 Uov07RL0MiY+ec9YsFqt4vO+TcwNjC3yXYycHBICJhKX2+eydDFycQgJLGWUmL+7mRUiISNx
 cloDlC0s8edaFxtE0VtGiVsvFrCBJIQFwiUOT5nODGKzCRhKdL2FKBIRuMYo0fjmBZjDLPCP
 UeLV/CusEO13mCR+HL3FAtLCK2An0T17GjuIzSKgIvHu0ApGEFtUIE7iTM8LNogaQYmTM5+A
 1XMK2Ev8mX0ELM4sYCYxb/NDZghbXqJ562woW1zi1pP5TBMYhWYhaZ+FpGUWkpZZSFoWMLKs
 YhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIz3bcd+bt7BeGlj8CFGAQ5GJR7eG+8D4oVYE8uK
 K3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnAVJRXEm9oamhuYWlo
 bmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoHR33C50JXvMd0NFy3aj+zsDjAr31l9
 2SrhCqNK04STM9MLEmMye3/Lsx9c8F/1sW/fsxumf0JD9c60swYqMC7lq3iV6NF9W6lvCs/e
 +x/mX83hbGHycl0kEp0fyWtWuUl0r+x1NW7uMHN5tRyjnhkMF/edNVXfVrLAenOY8Od/N5N2
 VL6Mj1BiKc5INNRiLipOBACo0QHODQMAAA==
X-CMS-MailID: 20200904122731eucas1p180b68e5a1dc7e6e7de9013f74fdc12f5
X-Msg-Generator: CA
X-RootMTR: 20200826063536eucas1p2e29d2b061b8b74c06c9ea61ad6737ba2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063536eucas1p2e29d2b061b8b74c06c9ea61ad6737ba2
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063536eucas1p2e29d2b061b8b74c06c9ea61ad6737ba2@eucas1p2.samsung.com>
 <20200826063316.23486-15-m.szyprowski@samsung.com>
 <7298cc55-c550-0b41-3f3c-8eebed845848@arm.com>
 <e3f8d1d2-9c33-78be-56e6-ad214c7fb84c@ti.com>
 <c3173e34-7d78-4f39-8a64-bbbd4814b3c0@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christoph Hellwig <hch@lst.de>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGkgYWdhaW4sCgpPbiAwNC4wOS4yMDIwIDE0OjA2LCBNYXJlayBTenlwcm93c2tpIHdyb3RlOgo+
IEhpIFRvbWksCj4KPiBPbiAwMi4wOS4yMDIwIDEwOjAwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToK
Pj4gT24gMDEvMDkvMjAyMCAyMjozMywgUm9iaW4gTXVycGh5IHdyb3RlOgo+Pj4gT24gMjAyMC0w
OC0yNiAwNzozMiwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPj4+PiBUaGUgRG9jdW1lbnRhdGlv
bi9ETUEtQVBJLUhPV1RPLnR4dCBzdGF0ZXMgdGhhdCB0aGUgZG1hX21hcF9zZygpIAo+Pj4+IGZ1
bmN0aW9uCj4+Pj4gcmV0dXJucyB0aGUgbnVtYmVyIG9mIHRoZSBjcmVhdGVkIGVudHJpZXMgaW4g
dGhlIERNQSBhZGRyZXNzIHNwYWNlLgo+Pj4+IEhvd2V2ZXIgdGhlIHN1YnNlcXVlbnQgY2FsbHMg
dG8gdGhlIGRtYV9zeW5jX3NnX2Zvcl97ZGV2aWNlLGNwdX0oKSBhbmQKPj4+PiBkbWFfdW5tYXBf
c2cgbXVzdCBiZSBjYWxsZWQgd2l0aCB0aGUgb3JpZ2luYWwgbnVtYmVyIG9mIHRoZSBlbnRyaWVz
Cj4+Pj4gcGFzc2VkIHRvIHRoZSBkbWFfbWFwX3NnKCkuCj4+Pj4KPj4+PiBzdHJ1Y3Qgc2dfdGFi
bGUgaXMgYSBjb21tb24gc3RydWN0dXJlIHVzZWQgZm9yIGRlc2NyaWJpbmcgYSAKPj4+PiBub24t
Y29udGlndW91cwo+Pj4+IG1lbW9yeSBidWZmZXIsIHVzZWQgY29tbW9ubHkgaW4gdGhlIERSTSBh
bmQgZ3JhcGhpY3Mgc3Vic3lzdGVtcy4gSXQKPj4+PiBjb25zaXN0cyBvZiBhIHNjYXR0ZXJsaXN0
IHdpdGggbWVtb3J5IHBhZ2VzIGFuZCBETUEgYWRkcmVzc2VzIChzZ2wgCj4+Pj4gZW50cnkpLAo+
Pj4+IGFzIHdlbGwgYXMgdGhlIG51bWJlciBvZiBzY2F0dGVybGlzdCBlbnRyaWVzOiBDUFUgcGFn
ZXMgKG9yaWdfbmVudHMgCj4+Pj4gZW50cnkpCj4+Pj4gYW5kIERNQSBtYXBwZWQgcGFnZXMgKG5l
bnRzIGVudHJ5KS4KPj4+Pgo+Pj4+IEl0IHR1cm5lZCBvdXQgdGhhdCBpdCB3YXMgYSBjb21tb24g
bWlzdGFrZSB0byBtaXN1c2UgbmVudHMgYW5kIAo+Pj4+IG9yaWdfbmVudHMKPj4+PiBlbnRyaWVz
LCBjYWxsaW5nIERNQS1tYXBwaW5nIGZ1bmN0aW9ucyB3aXRoIGEgd3JvbmcgbnVtYmVyIG9mIAo+
Pj4+IGVudHJpZXMgb3IKPj4+PiBpZ25vcmluZyB0aGUgbnVtYmVyIG9mIG1hcHBlZCBlbnRyaWVz
IHJldHVybmVkIGJ5IHRoZSBkbWFfbWFwX3NnKCkKPj4+PiBmdW5jdGlvbi4KPj4+Pgo+Pj4+IEZp
eCB0aGUgY29kZSB0byByZWZlciB0byBwcm9wZXIgbmVudHMgb3Igb3JpZ19uZW50cyBlbnRyaWVz
LiBUaGlzIAo+Pj4+IGRyaXZlcgo+Pj4+IGNoZWNrcyBmb3IgYSBidWZmZXIgY29udGlndWl0eSBp
biBETUEgYWRkcmVzcyBzcGFjZSwgc28gaXQgc2hvdWxkIHRlc3QKPj4+PiBzZ190YWJsZS0+bmVu
dHMgZW50cnkuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6
eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9vbWFwX2dlbS5jIHwgNiArKystLS0KPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyAKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZ2VtLmMKPj4+PiBpbmRleCBmZjBjNGIwYzNmZDAuLmE3YTlhMGFmZTJiNiAx
MDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCj4+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwo+Pj4+IEBAIC00OCw3ICs0
OCw3IEBAIHN0cnVjdCBvbWFwX2dlbV9vYmplY3Qgewo+Pj4+IMKgwqDCoMKgwqDCoMKgICrCoMKg
IE9NQVBfQk9fTUVNX0RNQV9BUEkgZmxhZyBzZXQpCj4+Pj4gwqDCoMKgwqDCoMKgwqAgKgo+Pj4+
IMKgwqDCoMKgwqDCoMKgICogLSBidWZmZXJzIGltcG9ydGVkIGZyb20gZG1hYnVmICh3aXRoIHRo
ZSAKPj4+PiBPTUFQX0JPX01FTV9ETUFCVUYgZmxhZyBzZXQpCj4+Pj4gLcKgwqDCoMKgICrCoMKg
IGlmIHRoZXkgYXJlIHBoeXNpY2FsbHkgY29udGlndW91cyAod2hlbiBzZ3QtPm9yaWdfbmVudHMg
Cj4+Pj4gPT0gMSkKPj4+PiArwqDCoMKgwqAgKsKgwqAgaWYgdGhleSBhcmUgcGh5c2ljYWxseSBj
b250aWd1b3VzICh3aGVuIHNndC0+bmVudHMgPT0gMSkKPj4+IEhtbSwgaWYgdGhpcyByZWFsbHkg
ZG9lcyBtZWFuICpwaHlzaWNhbGx5KiBjb250aWd1b3VzIC0gaS5lLiBpZiAKPj4+IGJ1ZmZlcnMg
bWlnaHQgYmUgc2hhcmVkIGJldHdlZW4KPj4+IERNQS10cmFuc2xhdGFibGUgYW5kIG5vbi1ETUEt
dHJhbnNsYXRhYmxlIGRldmljZXMgLSB0aGVuIHRoZXNlIAo+Pj4gY2hhbmdlcyBtaWdodCBub3Qg
YmUgYXBwcm9wcmlhdGUuIElmCj4+PiBub3QgYW5kIGl0IG9ubHkgYWN0dWFsbHkgbWVhbnMgRE1B
LWNvbnRpZ3VvdXMsIHRoZW4gaXQgd291bGQgYmUgZ29vZCAKPj4+IHRvIGNsYXJpZnkgdGhlIGNv
bW1lbnRzIHRvIHRoYXQKPj4+IGVmZmVjdC4KPj4+Cj4+PiBDYW4gYW55b25lIGZhbWlsaWFyIHdp
dGggb21hcGRybSBjbGFyaWZ5IHdoYXQgZXhhY3RseSB0aGUgY2FzZSBpcyAKPj4+IGhlcmU/IEkg
a25vdyB0aGF0IElPTU1VcyBtaWdodCBiZQo+Pj4gaW52b2x2ZWQgdG8gc29tZSBkZWdyZWUsIGFu
ZCBJJ3ZlIHNraW1tZWQgdGhlIGludGVyY29ubmVjdCBjaGFwdGVycyAKPj4+IG9mIGVub3VnaCBP
TUFQIFRSTXMgdG8gYmUgc2NhcmVkCj4+PiBieSB0aGUgcmVmZXJlbmNlIHRvIHRoZSB0aWxlciBh
cGVydHVyZSBpbiB0aGUgY29udGV4dCBiZWxvdyA6KQo+PiBEU1MgKGxpa2UgbWFueSBvdGhlciBJ
UHMgaW4gT01BUCkgZG9lcyBub3QgaGF2ZSBhbnkgTU1VL1BBVCwgYW5kIGNhbiAKPj4gb25seSB1
c2UgY29udGlndW91cyBidWZmZXJzCj4+IChjb250aWd1b3VzIGluIHRoZSBSQU0pLgo+Pgo+PiBU
aGVyZSdzIGEgc3BlY2lhbCBjYXNlIHdpdGggVElMRVIgKHdoaWNoIGlzIG5vdCBwYXJ0IG9mIERT
UyBidXQgb2YgCj4+IHRoZSBtZW1vcnkgc3Vic3lzdGVtLCBidXQgaXQncwo+PiBzdGlsbCBoYW5k
bGVkIGludGVybmFsbHkgYnkgdGhlIG9tYXBkcm0gZHJpdmVyKSwgd2hpY2ggaGFzIGEgUEFULiBQ
QVQgCj4+IGNhbiBjcmVhdGUgYSBjb250aWd1b3VzIHZpZXcKPj4gb2Ygc2NhdHRlcmVkIHBhZ2Vz
LCBhbmQgRFNTIGNhbiB0aGVuIHVzZSB0aGlzIGNvbnRpZ3VvdXMgdmlldyAoInRpbGVyIAo+PiBh
cGVydHVyZSIsIHdoaWNoIHRvIERTUyBsb29rcwo+PiBqdXN0IGxpa2Ugbm9ybWFsIGNvbnRpZ3Vv
dXMgbWVtb3J5KS4KPj4KPj4gTm90ZSB0aGF0IG9tYXBkcm0gZG9lcyBub3QgdXNlIGRtYV9tYXBf
c2coKSAmIGNvLiBtZW50aW9uZWQgaW4gdGhlIAo+PiBwYXRjaCBkZXNjcmlwdGlvbi4KPj4KPj4g
SWYgdGhlcmUncyBubyBNTVUvUEFULCBpcyBvcmlnX25lbnRzIGFsd2F5cyB0aGUgc2FtZSBhcyBu
ZW50cz8gT3IgY2FuIAo+PiB3ZSBoYXZlIG11bHRpcGxlIHBoeXNpY2FsbHkKPj4gY29udGlndW91
cyBwYWdlcyBsaXN0ZWQgc2VwYXJhdGVseSBpbiB0aGUgc2d0IChzbyBvcmlnX25lbnRzID4gMSkg
YnV0IAo+PiBhcyB0aGUgcGFnZXMgZm9ybSBvbmUgYmlnCj4+IGNvbnRpZ3VvdXMgYXJlYSwgbmVu
dHMgPT0gMT8KPgo+IFdlbGwsIHdoZW4gRE1BLW1hcHBpbmcgQVBJIGlzIHByb3Blcmx5IHVzZWQs
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gCj4gbmVudHMgYW5kIG9yaWdfbmVudHMgaXMgb25seSB3
aGVuIHRoZSBzY2F0dGVybGlzdCBoYXZlIGJlZW4gbWFwcGVkIGZvciAKPiBETUEuCj4KPiBGb3Ig
dGhlIG1lbnRpb25lZCBjYXNlLCBldmVuIGlmIHRoZSBjcmVhdG9yIG9mIHRoZSBidWZmZXIgdXNl
ZCBvbmx5IAo+IHRoZSBwYWdlcyB0aGF0IGFyZSBjb25zZWN1dGl2ZSBpbiB0aGUgcGh5c2ljYWwg
bWVtb3J5LCBoZSBpcyBmcmVlIHRvIAo+IGNob3NlIGVpdGhlciB0byBzZXQgbmVudHMvb3JpZ19u
ZW50cyB0byAxIGFuZCBsZW5ndGggdG8gbipQQUdFX1NJWkUgb3IgCj4gc2V0IG5lbnRzL29yaWdf
bmVudHMgdG8gbiBhbmQgbGVuZ3RoIHRvIFBBR0VfU0laRSBmb3IgZWFjaC4gVGhlbiB0aGUgCj4g
YnVmZmVyIGNodW5rcyBtaWdodCBiZSBtZXJnZWQsIGJ1dCB0aGlzIGlzIGRvbmUgYnkgdGhlIERN
QS1tYXBwaW5nIAo+IGNvZGUuIEZvciB5b3VyIGNhc2UsIHdpdGhvdXQgYW55IGNhbGwgdG8gRE1B
LW1hcHBpbmcsIHlvdSBjYW4gb25seSAKPiBhc3N1bWUgdGhhdCB0aGUgYnVmZmVyIGlzIGNvbnRp
Z3VvdXMgaW4gcGh5c2ljYWwgbWVtb3J5IGlmIG9yaWdfbmVudHMgCj4gaXMgMS4KPgo+IEkndmUg
Y2hhbmdlZCB0aGUgdXNlIG9mIG5lbnRzIHRvIG9yaWdfbmVudHMgdG8gbWFrZSB0aGluZ3MgY29u
c2lzdGVudCAKPiAtIHRoaXMgY29kZSBvcGVyYXRlcyBvbmx5IG9uIHRoZSB1bm1hcHBlZCBidWZm
ZXJzLiBJIHdhbnQgdG8gZW5zdXJlIAo+IHRoYXQgYW55b25lIHdobyB3aWxsIHBvdGVudGlhbGx5
IGNvcHkgdGhpcyBjb2RlLCB3b24ndCBtYWtlIHRoZSAKPiBuZW50cy9vcmlnX25lbnRzIG1pc3Rh
a2UgaW4gdGhlIGZ1dHVyZS4KCkkndmUganVzdCBub3RpY2VkIHRoYXQgSSd2ZSByZWFkIG15IHBh
dGNoICh0aGUgZGlmZikgaW4gdGhlIHJldmVyc2UgCm9yZGVyLCBJJ20gc29ycnkuIFRoZSBvbWFw
ZHJtIGNvZGUgaXMgcmlnaHQsIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGRyb3BwZWQuCgpCZXN0IHJl
Z2FyZHMKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9s
YW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21t
dSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
