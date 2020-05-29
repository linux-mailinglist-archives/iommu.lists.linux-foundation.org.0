Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7121E7141
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 02:24:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2CB0021548;
	Fri, 29 May 2020 00:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xZ0hZFrn3Ke; Fri, 29 May 2020 00:24:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2BCD821509;
	Fri, 29 May 2020 00:24:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A448C0895;
	Fri, 29 May 2020 00:24:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F21FC016F;
 Fri, 29 May 2020 00:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49B818917B;
 Fri, 29 May 2020 00:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wlCgk2Kn-+9E; Fri, 29 May 2020 00:24:25 +0000 (UTC)
X-Greylist: delayed 00:22:19 by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3BE3088C67;
 Fri, 29 May 2020 00:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SHO6IGYEd6YDcItDhjnlUPf5s8OIRwKvgFq6kM1/DP0=; b=r/axjxYlIiDMYaBSzOJcmN4D8z
 5nhVyK5+jkTuLY9r/DkIPGDqA4zBXW2lnj24/75M8PApunP8NH63l8JZKK4zOM+RkgNUjkh8Zu7L0
 uAWAMjn96WqKiZuaMyo8cBfMY0aRwfiPej4ElwlF0HqAS+905dMVMngwIHFwJNhllq+TXuBP3naK4
 /r6v4D4I21bAG2X4/zOYuy5cJVYuMqe8ZbDWBeVK1iPsKmEydsM4SFCoqrouhRTbQELtOXUOa1f+x
 r0Injuuidql/AmLXAXcQzgEff4xFuOZ6W7hJhBwZm1rFF3QVErdj3XcX2phEoDBlDrcVSy7R3MomJ
 Ro1gd+aA==;
Received: from s0106602ad0811846.cg.shawcable.net ([68.147.191.165]
 helo=[192.168.0.12])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1jeSSD-0001kd-5g; Thu, 28 May 2020 18:00:54 -0600
To: Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org
References: <20191221150402.13868-1-murphyt7@tcd.ie>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
Date: Thu, 28 May 2020 18:00:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20191221150402.13868-1-murphyt7@tcd.ie>
Content-Language: en-US
X-SA-Exim-Connect-IP: 68.147.191.165
X-SA-Exim-Rcpt-To: baolu.lu@linux.intel.com, robin.murphy@arm.com,
 kgene@kernel.org, linux-kernel@vger.kernel.org, cohuck@redhat.com,
 dwmw2@infradead.org, gerald.schaefer@de.ibm.com,
 virtualization@lists.linux-foundation.org, tglx@linutronix.de,
 matthias.bgg@gmail.com, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, alex.williamson@redhat.com,
 eric.auger@redhat.com, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, agross@kernel.org,
 linux-rockchip@lists.infradead.org, jonathanh@nvidia.com, krzk@kernel.org,
 maz@kernel.org, linux-samsung-soc@vger.kernel.org, jean-philippe@linaro.org,
 m.szyprowski@samsung.com, will@kernel.org, thierry.reding@gmail.com,
 julien.grall@arm.com, linux-tegra@vger.kernel.org, bjorn.andersson@linaro.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, kvm@vger.kernel.org,
 iommu@lists.linux-foundation.org, murphyt7@tcd.ie
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Kukjin Kim <kgene@kernel.org>, David Woodhouse <dwmw2@infradead.org>
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

SGkgVG9tLAoKT24gMjAxOS0xMi0yMSA4OjAzIGEubS4sIFRvbSBNdXJwaHkgd3JvdGU6Cj4gVGhp
cyBwYXRjaHNldCBjb252ZXJ0cyB0aGUgaW50ZWwgaW9tbXUgZHJpdmVyIHRvIHRoZSBkbWEtaW9t
bXUgYXBpLgoKSnVzdCB3YW50ZWQgdG8gbm90ZSB0aGF0IEkndmUgcmViYXNlZCB5b3VyIHNlcmll
cyBvbiByZWNlbnQga2VybmVscyBhbmQKaGF2ZSBkb25lIHNvbWUgdGVzdGluZyBvbiBteSBvbGQg
U2FuZHlicmlkZ2UgbWFjaGluZSAod2l0aG91dCB0aGUgRE8gTk9UCk1FUkdFIHBhdGNoKSBhbmQg
aGF2ZSBmb3VuZCBubyBpc3N1ZXMuIEkgaG9wZSB0aGlzIGNhbiBtYWtlIHByb2dyZXNzCnNvb24g
YW5kIGdldCBtZXJnZWQgc29vbi4gSWYgeW91IGxpa2UgeW91IGNhbiBhZGQ6CgpUZXN0ZWQtQnk6
IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KCj4gV2hpbGUgY29udmVydGlu
ZyB0aGUgZHJpdmVyIEkgZXhwb3NlZCBhIGJ1ZyBpbiB0aGUgaW50ZWwgaTkxNSBkcml2ZXIgd2hp
Y2ggY2F1c2VzIGEgaHVnZSBhbW91bnQgb2YgYXJ0aWZhY3RzIG9uIHRoZSBzY3JlZW4gb2YgbXkg
bGFwdG9wLiBZb3UgY2FuIHNlZSBhIHBpY3R1cmUgb2YgaXQgaGVyZToKPiBodHRwczovL2dpdGh1
Yi5jb20vcGlwcHkzNjAva2VybmVsUGF0Y2hlcy9ibG9iL21hc3Rlci9JTUdfMjAxOTEyMTlfMjI1
OTIyLmpwZwo+IAo+IFRoaXMgaXNzdWUgaXMgbW9zdCBsaWtlbHkgaW4gdGhlIGk5MTUgZHJpdmVy
IGFuZCBpcyBtb3N0IGxpa2VseSBjYXVzZWQgYnkgdGhlIGRyaXZlciBub3QgcmVzcGVjdGluZyB0
aGUgcmV0dXJuIHZhbHVlIG9mIHRoZSBkbWFfbWFwX29wczo6bWFwX3NnIGZ1bmN0aW9uLiBZb3Ug
Y2FuIHNlZSB0aGUgZHJpdmVyIGlnbm9yaW5nIHRoZSByZXR1cm4gdmFsdWUgaGVyZToKPiBodHRw
czovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi83ZTAxNjViMmYxYTkxMmEwNmUzODFl
OTFmMGY0ZTQ5NWY0YWMzNzM2L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFi
dWYuYyNMNTEKPiAKPiBQcmV2aW91c2x5IHRoaXMgZGlkbuKAmXQgY2F1c2UgaXNzdWVzIGJlY2F1
c2UgdGhlIGludGVsIG1hcF9zZyBhbHdheXMgcmV0dXJuZWQgdGhlIHNhbWUgbnVtYmVyIG9mIGVs
ZW1lbnRzIGFzIHRoZSBpbnB1dCBzY2F0dGVyIGdhdGhlciBsaXN0IGJ1dCB3aXRoIHRoZSBjaGFu
Z2UgdG8gdGhpcyBkbWEtaW9tbXUgYXBpIHRoaXMgaXMgbm8gbG9uZ2VyIHRoZSBjYXNlLiBJIHdh
c27igJl0IGFibGUgdG8gdHJhY2sgdGhlIGJ1ZyBkb3duIHRvIGEgc3BlY2lmaWMgbGluZSBvZiBj
b2RlIHVuZm9ydHVuYXRlbHkuICAKCkkgZGlkIHNvbWUgZGlnZ2luZyBpbnRvIHRoaXMgbXlzZWxm
IGFuZCB3aGlsZSBJIGRvbid0IGhhdmUgZnVsbCBwYXRjaCwgSQp0aGluayBJIHRyYWNlZCBpdCBj
bG9zZXIgdG8gdGhlIHByb2JsZW0uCgpTYWRseSwgaWdub3JpbmcgdGhlIG51bWJlciBvZiBuZW50
cyByZXR1cm5lZCBieSBtYXBfc2coKSBpcyBlbmRlbWljIHRvCmRtYS1idWYgdXNlcnMsIGJ1dCBB
TUQncyBHUFUgZHJpdmVyIHNlZW1zIHRvIGRvIHRoZSBzYW1lIHRoaW5nLApwcmVzdW1hYmx5IHdp
dGhvdXQgaXNzdWVzLgoKRGlnZ2luZyBhIGJpdCBmdXJ0aGVyLCBJIGZvdW5kIHRoYXQgdGhlIGk5
MTUgaGFzIGFuICJpbm5vdmF0aXZlIiB3YXkgb2YKaXRlcmF0aW5nIHRocm91Z2ggU0dMcywgc2Vl
IFsxXS4gSSBzdXNwZWN0IGlmIF9fc2d0X2l0ZXIgaXMgY2hhbmdlZCB0bwppbmNyZW1lbnQgd2l0
aCBzZ19kbWFfbGVuKCkgYW5kIHJldHVybiBOVUxMIHdoZW4gdGhlcmUgaXMgbm8gbGVuZ3RoCmxl
ZnQsIGl0IG1heSBmaXggdGhlIGlzc3VlLgoKQnV0LCBzb3JyeSwgSSBkb24ndCByZWFsbHkgaGF2
ZSB0aGUgbWVhbnMgb3IgdGltZSB0byBmaXggYW5kIHRlc3QgdGhpcwpteXNlbGYuCgpUaGFua3Ms
CgpMb2dhbgoKWzFdCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjctcmM3L3Nv
dXJjZS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3NjYXR0ZXJsaXN0LmgjTDc2Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlz
dAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
