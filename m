Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C9640264E
	for <lists.iommu@lfdr.de>; Tue,  7 Sep 2021 11:43:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D36A404AD;
	Tue,  7 Sep 2021 09:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7JsMBwh56ZS; Tue,  7 Sep 2021 09:43:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 089B6401E9;
	Tue,  7 Sep 2021 09:43:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA203C001D;
	Tue,  7 Sep 2021 09:43:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2C80C000D
 for <iommu@lists.linux-foundation.org>; Tue,  7 Sep 2021 09:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3FA94051B
 for <iommu@lists.linux-foundation.org>; Tue,  7 Sep 2021 09:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mh5CQqlxXZ3B for <iommu@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 09:43:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C12A40630
 for <iommu@lists.linux-foundation.org>; Tue,  7 Sep 2021 09:43:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 995D131B;
 Tue,  7 Sep 2021 02:43:12 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B47C3F766;
 Tue,  7 Sep 2021 02:43:11 -0700 (PDT)
Subject: Re: [question] Assign multiple devices from different SMMUs to a
 arm_smmu_domain
To: Kunkun Jiang <jiangkunkun@huawei.com>, Will Deacon <will@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <bbfcb875-0da1-c303-ed48-fdaa890c89b3@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <202f32cd-8036-563e-028b-781b999766be@arm.com>
Date: Tue, 7 Sep 2021 10:43:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bbfcb875-0da1-c303-ed48-fdaa890c89b3@huawei.com>
Content-Language: en-GB
Cc: wanghaibin.wang@huawei.com
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

T24gMjAyMS0wOS0wNyAwODo0MSwgS3Vua3VuIEppYW5nIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBJ
IGFtIHdvcmtpbmcgb24gVkZJTyBETUEgZGlydHkgcGFnZXMgdHJhY2tpbmcgYmFzZWQgb24gQVJN
IFNNTVUgSFRUVSwKPiBhbmQgaGF2ZSBkb25lIGEgbG90IG9mIHRlc3RpbmcuSW4gdGhlIHRlc3Qs
IEkgZm91bmQgYSBwcm9ibGVtIHRoYXQgCj4gZ3JlYXRseSBhZmZlY3RzCj4gcGVyZm9ybWFuY2Ug
b2YgVkZJTyBETUEgZGlydHkgcGFnZXMgdHJhY2tpbmcuCj4gCj4gQWNjb3JkaW5nIHRvIHRoZSBj
dXJyZW50IGFybS1zbW11LXYzIGRyaXZlciwgbXVsdGlwbGUgVkZJTyBwYXNzLXRocm91Z2gKPiBk
ZXZpY2UgY29tZXMgZnJvbSBkaWZmZXJlbnQgU01NVXMgd2lsbCBiZSBhc3NpZ25lZCB0byBkaWZm
ZXJlbnQKPiBhcm1fc21tdV9kb21haW4uIEl0IHdpbGwgY3JlYXRlIHBhZ2UgdGFibGUgZm9yIGVh
Y2ggYXJtX3NtbXVfZG9tYWluLAo+IGV2ZW4gdGhvdWdoIHRoZXNlIHBhZ2UgdGFibGVzIGFyZSBl
eGFjdGx5IHRoZSBzYW1lLiBCYWNhdXNlIGRpcnR5IHBhZ2VzCj4gdHJhY2tpbmcgbmVlZHMgdG8g
dHJhdmVyc2UgdGhlIHBhZ2UgdGFibGUsIG11bHRpcGxlIHBhZ2UgdGFibGVzIHdpbGwgbWFrZQo+
IHBlcmZvcm1hbmNlIHdvcnNlLgo+IAo+IEkgbGVhcm5lZCB0aGUgQVJNIFNNTVV2MyBzcGVjIGFu
ZCBoYWQgc29tZSBleGNoYW5nZXMgd2l0aCBteSBjb2xsZWFndWVzCj4gd2hvIHdvcmsgb24gU01N
VSBoYXJkd2FyZS4gSSBkaWQgbm90IGZpbmQgdGhlIHJlc3RyaWN0aW9uIHRoYXQgbXVsdGlwbGUK
PiBTTU1VcyBjYW5ub3Qgc2hhcmUgdGhlIHNhbWUgcGFnZSB0YWJsZS4gV2UgbWlndGggYmUgYWJs
ZSB0byBkbyB0aGlzIGxpa2UKPiB4ODYgSU9NTVUuIElmIEkgaGF2ZSBtaXNzZWQgc29tZXRoaW5n
LCBwbGVhc2UgcG9pbnQgaXQgb3V0LgoKU3VyZSwgaXQncyBub3QgaW1wb3NzaWJsZSwgdGhlcmUg
YXJlIGp1c3QgYSBsb3Qgb2YgZmlkZGx5IApjb25zaWRlcmF0aW9ucywgbW9zdGx5IGFyb3VuZCBo
b3cgdG8gaGFuZGxlIFNNTVUgaW5zdGFuY2VzIHdpdGggCmRpZmZlcmVudCBjYXBhYmlsaXRpZXMu
IFdlIGhhdmVuJ3QgaGFkIGEgc3Ryb25nIG5lZWQgdG8gc3VwcG9ydCB0aGlzIApjYXNlIHNvIGZh
ciwgc28gd2UndmUgc2ltcGx5IGJlZW4gYXZvaWRpbmcgYWxsIHRoYXQgY29tcGxleGl0eS4KClJv
YmluLgoKPiBMb29raW5nIGZvcndhcmQgdG8geW91ciBzdWdnZXN0aW9ucy7wn5iBCj4gCj4gVGhh
bmtzLAo+IEt1bmt1biBKaWFuZwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW9tbXU=
