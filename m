Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EC69E2FA08F
	for <lists.iommu@lfdr.de>; Mon, 18 Jan 2021 13:59:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8D8178700D;
	Mon, 18 Jan 2021 12:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rA9G9pck+598; Mon, 18 Jan 2021 12:59:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D8FBA87021;
	Mon, 18 Jan 2021 12:59:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDCC6C013A;
	Mon, 18 Jan 2021 12:59:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DD02C013A
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 12:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 12F118701F
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 12:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTPI2ewz79Xs for <iommu@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 12:59:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 24F3C8700D
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 12:59:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52AC731B;
 Mon, 18 Jan 2021 04:59:31 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E36F3F719;
 Mon, 18 Jan 2021 04:59:30 -0800 (PST)
Subject: Re: [PATCH v4 2/3] iommu/iova: Avoid double-negatives in magazine
 helpers
To: John Garry <john.garry@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <1607538189-237944-1-git-send-email-john.garry@huawei.com>
 <1607538189-237944-3-git-send-email-john.garry@huawei.com>
 <YAHRKCkcHAEUdRNT@larix.localdomain>
 <69c30e85-4a72-a0e1-1e56-4ffbd0df5aba@huawei.com> <YAVeDOiKBEKZ2Tdq@myrica>
 <cdc77ccd-823d-464b-fe3c-2a9da17bcb61@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <69614e38-fcc0-4220-e1cd-15de91dd61ef@arm.com>
Date: Mon, 18 Jan 2021 12:59:26 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <cdc77ccd-823d-464b-fe3c-2a9da17bcb61@huawei.com>
Content-Language: en-GB
Cc: will@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linuxarm@huawei.com
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

T24gMjAyMS0wMS0xOCAxMDo1NSwgSm9obiBHYXJyeSB3cm90ZToKPiBPbiAxOC8wMS8yMDIxIDEw
OjA4LCBKZWFuLVBoaWxpcHBlIEJydWNrZXIgd3JvdGU6Cj4+Pj4gQW55IGlkZWEgd2h5IHRoYXQn
cyBoYXBwZW5pbmc/wqAgVGhpcyBmaXggc2VlbXMgb2sgYnV0IGlmIHdlJ3JlIAo+Pj4+IGV4cGVj
dGluZwo+Pj4+IGFsbG9jYXRpb24gZmFpbHVyZXMgZm9yIHRoZSBsb2FkZWQgbWFnYXppbmUgdGhl
biB3ZSBjb3VsZCBlYXNpbHkgZ2V0IGl0Cj4+Pj4gZm9yIGNwdV9yY2FjaGVzIHRvbywgYW5kIGdl
dCBhIHNpbWlsYXIgYWJvcnQgYXQgcnVudGltZS4KPj4+IEl0J3Mgbm90IHNwZWNpZmljYWxseSB0
aGF0IHdlIGV4cGVjdCB0aGVtIChhbGxvY2F0aW9uIGZhaWx1cmVzIGZvciB0aGUKPj4+IGxvYWRl
ZCBtYWdhemluZSksIHJhdGhlciB3ZSBzaG91bGQgbWFrZSBzYWZlIGFnYWluc3QgaXQuCj4+Pgo+
Pj4gU28gY291bGQgeW91IGJlIG1vcmUgc3BlY2lmaWMgaW4geW91ciBjb25jZXJuIGZvciB0aGUg
Y3B1X3JjYWNoZSAKPj4+IGZhaWx1cmU/Cj4+PiBjcHVfcmNhY2hlIG1hZ2F6aW5lIGFzc2lnbm1l
bnQgY29tZXMgZnJvbSB0aGlzIGxvZ2ljLgo+PiBJZiB0aGlzIGZhaWxzOgo+Pgo+PiBkcml2ZXJz
L2lvbW11L2lvdmEuYzo4NDc6IHJjYWNoZS0+Y3B1X3JjYWNoZXMgPSAKPj4gX19hbGxvY19wZXJj
cHUoc2l6ZW9mKCpjcHVfcmNhY2hlKSwgY2FjaGVfbGluZV9zaXplKCkpOwo+Pgo+PiB0aGVuIHdl
J2xsIGdldCBhbiBPb3BzIGluIF9faW92YV9yY2FjaGVfZ2V0KCkuIFNvIGlmIHdlJ3JlIG1ha2lu
ZyB0aGUKPj4gbW9kdWxlIHNhZmVyIGFnYWluc3QgbWFnYXppbmUgYWxsb2NhdGlvbiBmYWlsdXJl
LCBzaG91bGRuJ3Qgd2UgYWxzbwo+PiBwcm90ZWN0IGFnYWluc3QgY3B1X3JjYWNoZXMgYWxsb2Nh
dGlvbiBmYWlsdXJlPwo+IAo+IEFoLCBnb3RjaGEuIFNvIHdlIGhhdmUgdGhlIFdBUk4gdGhlcmUs
IGJ1dCB0aGF0J3Mgbm90IG11Y2ggdXNlIGFzIHRoaXMgCj4gd291bGQgc3RpbGwgY3Jhc2gsIGFz
IHlvdSBzYXkuCj4gCj4gU28gbWF5YmUgd2UgY2FuIGVtYmVkIHRoZSBjcHUgcmNhY2hlcyBpbiBp
b3ZhX2RvbWFpbiBzdHJ1Y3QsIHRvIGF2b2lkIAo+IHRoZSBzZXBhcmF0ZSAoZmFpbGFibGUpIGNw
dSByY2FjaGUgYWxsb2NhdGlvbi4KCklzIHRoYXQgZXZlbiBwb3NzaWJsZT8gVGhlIHNpemUgb2Yg
cGVyY3B1IGRhdGEgaXNuJ3Qga25vd24gYXQgY29tcGlsZSAKdGltZSwgc28gYXQgYmVzdCBpdCB3
b3VsZCBhZGQgdWdseSBydW50aW1lIGNvbXBsZXhpdHkgdG8gYW55IGFsbG9jYXRpb24gCm9mIGEg
c3RydWN0IGlvdmFfZG9tYWluIGJ5IGl0c2VsZiwgYnV0IHdvcnNlIHRoYW4gdGhhdCBpdCBtZWFu
cyB0aGF0IAplbWJlZGRpbmcgaW92YV9kb21haW4gaW4gYW55IG90aGVyIHN0cnVjdHVyZSBiZWNv
bWVzIGNvbXBsZXRlbHkgYnJva2VuLCBubz8KClJvYmluLgoKPiBBbHRlcm5hdGl2ZWx5LCB3ZSBj
b3VsZCBhZGQgTlVMTCBjaGVja3MgX19pb3ZhX3JjYWNoZV9nZXQoKSBldCBhbCBmb3IgCj4gdGhp
cyBhbGxvY2F0aW9uIGZhaWx1cmUgYnV0IHRoYXQncyBub3QgcHJlZmVyYWJsZSBhcyBpdCdzIGZh
c3RwYXRoLgo+IAo+IEZpbmFsbHkgc28gd2UgY291bGQgcGFzcyBiYWNrIGFuIGVycm9yIGNvZGUg
ZnJvbSBpbml0X2lvdmFfcmNhY2hlKCkgdG8gCj4gaXRzIG9ubHkgY2FsbGVyLCBpbml0X2lvdmFf
ZG9tYWluKCk7IGJ1dCB0aGF0IGhhcyBtdWx0aXBsZSBjYWxsZXJzIGFuZCAKPiB3b3VsZCBuZWVk
IHRvIGJlIGZpeGVkIHVwLgo+IAo+IE5vdCBzdXJlIHdoaWNoIGlzIGJlc3Qgb3Igb24gb3RoZXIg
b3B0aW9ucy4KPiAKPiBUaGFua3MsCj4gSm9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vaW9tbXU=
