Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 569BA25D861
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 14:06:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3329819CF;
	Fri,  4 Sep 2020 12:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HsohqZNeDY3; Fri,  4 Sep 2020 12:06:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C58486D11;
	Fri,  4 Sep 2020 12:06:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 010DFC0052;
	Fri,  4 Sep 2020 12:06:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B99ABC0052
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 12:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A7E4B86C76
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 12:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAa8h3xm7cYr for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 12:06:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E1EA386AEC
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 12:06:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904120624euoutp0191ad86a57b2868e527eeeb35b7c5fe79~xkzGzKcyh2956329563euoutp01i
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 12:06:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200904120624euoutp0191ad86a57b2868e527eeeb35b7c5fe79~xkzGzKcyh2956329563euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599221184;
 bh=Qccqpantv7098Ml50UgCDVb3Loq7kp7xS5fhoTvi36M=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YEaZg+6l213lcAk7DJd8UCrcVPHaJN2zlFOMWO74+trcPWik7pu96yBc3o3RTQqml
 V0RR/7BouGuL07K5B7XEzuqP6RHFyKxzDAHx8OtwKhEGd6M4DtUHQgLPHfoW5TQu/3
 AhRmCEqcOpwJT1td6L7EjzM9Sx8whTdG5d7FwmM4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904120623eucas1p175c50404f752feafabc1b8942433a493~xkzGacciI2432424324eucas1p1o;
 Fri,  4 Sep 2020 12:06:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 08.A3.06456.FBD225F5; Fri,  4
 Sep 2020 13:06:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904120623eucas1p1666abb8d389a9ceb81e94634244b51e8~xkzF53qTN1694916949eucas1p10;
 Fri,  4 Sep 2020 12:06:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904120623eusmtrp2a7eaad4ecb7497abdb5d6d8686dd8cbf~xkzF4olnt1972019720eusmtrp2y;
 Fri,  4 Sep 2020 12:06:23 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-27-5f522dbf6e40
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 60.22.06314.FBD225F5; Fri,  4
 Sep 2020 13:06:23 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904120622eusmtip1b95156e4bf33013e8f0d5c3aa0deeba2~xkzFQfLJX2905129051eusmtip1_;
 Fri,  4 Sep 2020 12:06:22 +0000 (GMT)
Subject: Re: [PATCH v9 14/32] drm: omapdrm: fix common struct sg_table
 related issues
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Robin Murphy
 <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <c3173e34-7d78-4f39-8a64-bbbd4814b3c0@samsung.com>
Date: Fri, 4 Sep 2020 14:06:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e3f8d1d2-9c33-78be-56e6-ad214c7fb84c@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUhTcRTtt/e2vclmr1V66UNraVCRJkW8ssQi4v0V4T9BkOuVj81yJpua
 mqBklKmzUkSdlXON2tQcmaltlWTkXCuTtDFdH5paaYiiWfaB5vay/O/cc87lnAuXwKSf+CuI
 +MRkVp3IJMgEfnhj24+Xm1s2x8i3/LJuo7QdDh51p8zCp2Ybr2BU99SYgDLXPOVR+pZI6uIV
 o5D62t3Po+oHXHyqy3pVQD0eH+RTlspeQbSYrr1ei+iH3/Q4XZFbzqebvvXx6ff5dh5915hF
 e2YGMLrYfQvRtp5sAV3YUI1ou7uJR0/WBx0UH/bbFccmxKey6vCoo37K6rY+LKlzXdrUNTPK
 RoWr85CIAHIbOMe+CPOQHyElTQh6K0cxryAlvyJ4WZzJCZMIciafYPMbRq0L44RbCIa6unFu
 GENQ2GIQel1LyUOgvzPucy0jXQgeTdcKvANG/kaQXzCMvC4BGQF5o3kCL5aQUfC2d8LH42QI
 aF90+vjlZCy0PfuAc54l4Cgf9GERuROM5xw+P0YGQ869CozDgdA7WMnzhgF5kYCfZifiiu+D
 7pEHOIeXwoi9QcjhVTB7f34hB0F/x20hNxQg6Dpb9nc7Et50/JyrRMxFbACLNZyj94DBXiX0
 0kD6g3t0CVfCH4oaSzGOlkDueSnnXg86e92/2Medr7DLSKZbcJpuwTm6Befo/ufqEV6NAtkU
 jUrBaiIS2dNhGkalSUlUhB0/papHc+/nnLFPNKOpV8daEUkgmVjiHjsol/KZVE26qhUBgcmW
 Sfa+cMZKJXFMegarPiVXpySwmla0ksBlgZKthuEjUlLBJLMnWTaJVc+rPEK0IhvxemrfVTXt
 dg2pS6ZvZ9lNO5h1ARNn22PkHzOedwa7HCVpJncoowwpP/H99Sbh5WDbvciYA3HRnu03RZmX
 YtudjqLDyZ7KZu2aG56Co3bzBVtN/K7pc2U7v1jrihpEoWszpixo+5nzdYqhgP0m2ydlqnhx
 aWEaHjKwSDT7ucAQJMM1SiZiI6bWMH8Aykz8TXoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRmVeSWpSXmKPExsVy+t/xu7r7dYPiDQ5uErLoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le26Jy4hN3iy5WHTBabHl9jtbi8aw6bxcEPT1gt1s+/xebA
 47Fm3hpGj73fFrB4zO6Yyeqx/dsDVo/73ceZPDYvqfe4/e8xs8fkG8sZPXbfbGDz6NuyitHj
 +I3tTB6fN8kF8ETp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSW
 pRbp2yXoZaw69oC54IJyxde5KxkbGPtkuxg5OSQETCSW9F5j7mLk4hASWMoosa/lFTtEQkbi
 5LQGVghbWOLPtS42iKK3jBK3j39mBkkIC4RLHJ4yHaxbROAao0TjmxdgVcwC/xglXs2/wgrR
 spxJ4ue3jYwgLWwChhJdb0FmcXLwCthJ3L31CSzOIqAi0Xv2AlhcVCBO4kzPC6gaQYmTM5+w
 gNicAlYSS1pOgtUzC5hJzNv8kBnClpdo3jobyhaXuPVkPtMERqFZSNpnIWmZhaRlFpKWBYws
 qxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjfduxn5t3MF7aGHyIUYCDUYmH98b7gHgh1sSy
 4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+MBXllcQbmhqaW1ga
 mhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpg1Kmp6z/cUOmV5MzO+lclc499ReFK
 EYkDS/5tz5sjwDH7/Z45b/1SzOd5JgYGzNwbKNfKXfj0TtU9jTeFdjdf9nziYpR5vd/2y8r/
 cyV1wzzM6uYatk0UXedwfmoM25eyP9vFjxutnvFB4cCLXK/nuVOKPj4/l+L6U2Pj7zPNc077
 bssJ+LX2oBJLcUaioRZzUXEiADp1tTkNAwAA
X-CMS-MailID: 20200904120623eucas1p1666abb8d389a9ceb81e94634244b51e8
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

SGkgVG9taSwKCk9uIDAyLjA5LjIwMjAgMTA6MDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+IE9u
IDAxLzA5LzIwMjAgMjI6MzMsIFJvYmluIE11cnBoeSB3cm90ZToKPj4gT24gMjAyMC0wOC0yNiAw
NzozMiwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPj4+IFRoZSBEb2N1bWVudGF0aW9uL0RNQS1B
UEktSE9XVE8udHh0IHN0YXRlcyB0aGF0IHRoZSBkbWFfbWFwX3NnKCkgZnVuY3Rpb24KPj4+IHJl
dHVybnMgdGhlIG51bWJlciBvZiB0aGUgY3JlYXRlZCBlbnRyaWVzIGluIHRoZSBETUEgYWRkcmVz
cyBzcGFjZS4KPj4+IEhvd2V2ZXIgdGhlIHN1YnNlcXVlbnQgY2FsbHMgdG8gdGhlIGRtYV9zeW5j
X3NnX2Zvcl97ZGV2aWNlLGNwdX0oKSBhbmQKPj4+IGRtYV91bm1hcF9zZyBtdXN0IGJlIGNhbGxl
ZCB3aXRoIHRoZSBvcmlnaW5hbCBudW1iZXIgb2YgdGhlIGVudHJpZXMKPj4+IHBhc3NlZCB0byB0
aGUgZG1hX21hcF9zZygpLgo+Pj4KPj4+IHN0cnVjdCBzZ190YWJsZSBpcyBhIGNvbW1vbiBzdHJ1
Y3R1cmUgdXNlZCBmb3IgZGVzY3JpYmluZyBhIG5vbi1jb250aWd1b3VzCj4+PiBtZW1vcnkgYnVm
ZmVyLCB1c2VkIGNvbW1vbmx5IGluIHRoZSBEUk0gYW5kIGdyYXBoaWNzIHN1YnN5c3RlbXMuIEl0
Cj4+PiBjb25zaXN0cyBvZiBhIHNjYXR0ZXJsaXN0IHdpdGggbWVtb3J5IHBhZ2VzIGFuZCBETUEg
YWRkcmVzc2VzIChzZ2wgZW50cnkpLAo+Pj4gYXMgd2VsbCBhcyB0aGUgbnVtYmVyIG9mIHNjYXR0
ZXJsaXN0IGVudHJpZXM6IENQVSBwYWdlcyAob3JpZ19uZW50cyBlbnRyeSkKPj4+IGFuZCBETUEg
bWFwcGVkIHBhZ2VzIChuZW50cyBlbnRyeSkuCj4+Pgo+Pj4gSXQgdHVybmVkIG91dCB0aGF0IGl0
IHdhcyBhIGNvbW1vbiBtaXN0YWtlIHRvIG1pc3VzZSBuZW50cyBhbmQgb3JpZ19uZW50cwo+Pj4g
ZW50cmllcywgY2FsbGluZyBETUEtbWFwcGluZyBmdW5jdGlvbnMgd2l0aCBhIHdyb25nIG51bWJl
ciBvZiBlbnRyaWVzIG9yCj4+PiBpZ25vcmluZyB0aGUgbnVtYmVyIG9mIG1hcHBlZCBlbnRyaWVz
IHJldHVybmVkIGJ5IHRoZSBkbWFfbWFwX3NnKCkKPj4+IGZ1bmN0aW9uLgo+Pj4KPj4+IEZpeCB0
aGUgY29kZSB0byByZWZlciB0byBwcm9wZXIgbmVudHMgb3Igb3JpZ19uZW50cyBlbnRyaWVzLiBU
aGlzIGRyaXZlcgo+Pj4gY2hlY2tzIGZvciBhIGJ1ZmZlciBjb250aWd1aXR5IGluIERNQSBhZGRy
ZXNzIHNwYWNlLCBzbyBpdCBzaG91bGQgdGVzdAo+Pj4gc2dfdGFibGUtPm5lbnRzIGVudHJ5Lgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1z
dW5nLmNvbT4KPj4+IC0tLQo+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2Vt
LmMgfCA2ICsrKy0tLQo+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCj4+PiBpbmRl
eCBmZjBjNGIwYzNmZDAuLmE3YTlhMGFmZTJiNiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZ2VtLmMKPj4+IEBAIC00OCw3ICs0OCw3IEBAIHN0cnVjdCBvbWFwX2dlbV9vYmplY3Qg
ewo+Pj4gIMKgwqDCoMKgwqDCoCAqwqDCoCBPTUFQX0JPX01FTV9ETUFfQVBJIGZsYWcgc2V0KQo+
Pj4gIMKgwqDCoMKgwqDCoCAqCj4+PiAgwqDCoMKgwqDCoMKgICogLSBidWZmZXJzIGltcG9ydGVk
IGZyb20gZG1hYnVmICh3aXRoIHRoZSBPTUFQX0JPX01FTV9ETUFCVUYgZmxhZyBzZXQpCj4+PiAt
wqDCoMKgwqAgKsKgwqAgaWYgdGhleSBhcmUgcGh5c2ljYWxseSBjb250aWd1b3VzICh3aGVuIHNn
dC0+b3JpZ19uZW50cyA9PSAxKQo+Pj4gK8KgwqDCoMKgICrCoMKgIGlmIHRoZXkgYXJlIHBoeXNp
Y2FsbHkgY29udGlndW91cyAod2hlbiBzZ3QtPm5lbnRzID09IDEpCj4+IEhtbSwgaWYgdGhpcyBy
ZWFsbHkgZG9lcyBtZWFuICpwaHlzaWNhbGx5KiBjb250aWd1b3VzIC0gaS5lLiBpZiBidWZmZXJz
IG1pZ2h0IGJlIHNoYXJlZCBiZXR3ZWVuCj4+IERNQS10cmFuc2xhdGFibGUgYW5kIG5vbi1ETUEt
dHJhbnNsYXRhYmxlIGRldmljZXMgLSB0aGVuIHRoZXNlIGNoYW5nZXMgbWlnaHQgbm90IGJlIGFw
cHJvcHJpYXRlLiBJZgo+PiBub3QgYW5kIGl0IG9ubHkgYWN0dWFsbHkgbWVhbnMgRE1BLWNvbnRp
Z3VvdXMsIHRoZW4gaXQgd291bGQgYmUgZ29vZCB0byBjbGFyaWZ5IHRoZSBjb21tZW50cyB0byB0
aGF0Cj4+IGVmZmVjdC4KPj4KPj4gQ2FuIGFueW9uZSBmYW1pbGlhciB3aXRoIG9tYXBkcm0gY2xh
cmlmeSB3aGF0IGV4YWN0bHkgdGhlIGNhc2UgaXMgaGVyZT8gSSBrbm93IHRoYXQgSU9NTVVzIG1p
Z2h0IGJlCj4+IGludm9sdmVkIHRvIHNvbWUgZGVncmVlLCBhbmQgSSd2ZSBza2ltbWVkIHRoZSBp
bnRlcmNvbm5lY3QgY2hhcHRlcnMgb2YgZW5vdWdoIE9NQVAgVFJNcyB0byBiZSBzY2FyZWQKPj4g
YnkgdGhlIHJlZmVyZW5jZSB0byB0aGUgdGlsZXIgYXBlcnR1cmUgaW4gdGhlIGNvbnRleHQgYmVs
b3cgOikKPiBEU1MgKGxpa2UgbWFueSBvdGhlciBJUHMgaW4gT01BUCkgZG9lcyBub3QgaGF2ZSBh
bnkgTU1VL1BBVCwgYW5kIGNhbiBvbmx5IHVzZSBjb250aWd1b3VzIGJ1ZmZlcnMKPiAoY29udGln
dW91cyBpbiB0aGUgUkFNKS4KPgo+IFRoZXJlJ3MgYSBzcGVjaWFsIGNhc2Ugd2l0aCBUSUxFUiAo
d2hpY2ggaXMgbm90IHBhcnQgb2YgRFNTIGJ1dCBvZiB0aGUgbWVtb3J5IHN1YnN5c3RlbSwgYnV0
IGl0J3MKPiBzdGlsbCBoYW5kbGVkIGludGVybmFsbHkgYnkgdGhlIG9tYXBkcm0gZHJpdmVyKSwg
d2hpY2ggaGFzIGEgUEFULiBQQVQgY2FuIGNyZWF0ZSBhIGNvbnRpZ3VvdXMgdmlldwo+IG9mIHNj
YXR0ZXJlZCBwYWdlcywgYW5kIERTUyBjYW4gdGhlbiB1c2UgdGhpcyBjb250aWd1b3VzIHZpZXcg
KCJ0aWxlciBhcGVydHVyZSIsIHdoaWNoIHRvIERTUyBsb29rcwo+IGp1c3QgbGlrZSBub3JtYWwg
Y29udGlndW91cyBtZW1vcnkpLgo+Cj4gTm90ZSB0aGF0IG9tYXBkcm0gZG9lcyBub3QgdXNlIGRt
YV9tYXBfc2coKSAmIGNvLiBtZW50aW9uZWQgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uLgo+Cj4g
SWYgdGhlcmUncyBubyBNTVUvUEFULCBpcyBvcmlnX25lbnRzIGFsd2F5cyB0aGUgc2FtZSBhcyBu
ZW50cz8gT3IgY2FuIHdlIGhhdmUgbXVsdGlwbGUgcGh5c2ljYWxseQo+IGNvbnRpZ3VvdXMgcGFn
ZXMgbGlzdGVkIHNlcGFyYXRlbHkgaW4gdGhlIHNndCAoc28gb3JpZ19uZW50cyA+IDEpIGJ1dCBh
cyB0aGUgcGFnZXMgZm9ybSBvbmUgYmlnCj4gY29udGlndW91cyBhcmVhLCBuZW50cyA9PSAxPwoK
V2VsbCwgd2hlbiBETUEtbWFwcGluZyBBUEkgaXMgcHJvcGVybHkgdXNlZCwgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiAKbmVudHMgYW5kIG9yaWdfbmVudHMgaXMgb25seSB3aGVuIHRoZSBzY2F0dGVy
bGlzdCBoYXZlIGJlZW4gbWFwcGVkIGZvciBETUEuCgpGb3IgdGhlIG1lbnRpb25lZCBjYXNlLCBl
dmVuIGlmIHRoZSBjcmVhdG9yIG9mIHRoZSBidWZmZXIgdXNlZCBvbmx5IHRoZSAKcGFnZXMgdGhh
dCBhcmUgY29uc2VjdXRpdmUgaW4gdGhlIHBoeXNpY2FsIG1lbW9yeSwgaGUgaXMgZnJlZSB0byBj
aG9zZSAKZWl0aGVyIHRvIHNldCBuZW50cy9vcmlnX25lbnRzIHRvIDEgYW5kIGxlbmd0aCB0byBu
KlBBR0VfU0laRSBvciBzZXQgCm5lbnRzL29yaWdfbmVudHMgdG8gbiBhbmQgbGVuZ3RoIHRvIFBB
R0VfU0laRSBmb3IgZWFjaC4gVGhlbiB0aGUgYnVmZmVyIApjaHVua3MgbWlnaHQgYmUgbWVyZ2Vk
LCBidXQgdGhpcyBpcyBkb25lIGJ5IHRoZSBETUEtbWFwcGluZyBjb2RlLiBGb3IgCnlvdXIgY2Fz
ZSwgd2l0aG91dCBhbnkgY2FsbCB0byBETUEtbWFwcGluZywgeW91IGNhbiBvbmx5IGFzc3VtZSB0
aGF0IHRoZSAKYnVmZmVyIGlzIGNvbnRpZ3VvdXMgaW4gcGh5c2ljYWwgbWVtb3J5IGlmIG9yaWdf
bmVudHMgaXMgMS4KCkkndmUgY2hhbmdlZCB0aGUgdXNlIG9mIG5lbnRzIHRvIG9yaWdfbmVudHMg
dG8gbWFrZSB0aGluZ3MgY29uc2lzdGVudCAtIAp0aGlzIGNvZGUgb3BlcmF0ZXMgb25seSBvbiB0
aGUgdW5tYXBwZWQgYnVmZmVycy4gSSB3YW50IHRvIGVuc3VyZSB0aGF0IAphbnlvbmUgd2hvIHdp
bGwgcG90ZW50aWFsbHkgY29weSB0aGlzIGNvZGUsIHdvbid0IG1ha2UgdGhlIApuZW50cy9vcmln
X25lbnRzIG1pc3Rha2UgaW4gdGhlIGZ1dHVyZS4KCklmIHlvdSBkb24ndCBsaWtlIGl0LCB3ZSBj
YW4gZHJvcCB0aGlzIHBhdGNoLCBiZWNhdXNlIGl0IHdvbid0IGNoYW5nZSAKdGhlIHdheSB0aGUg
ZHJpdmVyIHdvcmtzLgoKQmVzdCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ft
c3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lvbW11
