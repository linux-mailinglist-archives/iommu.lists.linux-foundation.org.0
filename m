Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F91F8F50
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 09:20:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C17CD2318D;
	Mon, 15 Jun 2020 07:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5kz6AbnWTbd; Mon, 15 Jun 2020 07:20:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 493E22375C;
	Mon, 15 Jun 2020 07:20:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F7C6C016E;
	Mon, 15 Jun 2020 07:20:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CAE7C016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 641A686EFD
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g0whaXi3Wav1 for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 07:20:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3DC1286E8F
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:20:07 +0000 (UTC)
IronPort-SDR: ZexomesUp1Km56ETKYRekswgvDjL9SDxXYtx7XvXPMlwZ265kChhvtpQ1DTllOLd5WRnR/6WUv
 Egn6v+SINdFg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 00:20:05 -0700
IronPort-SDR: pVjKcvD5DUuXyhgZT/+naM0K/wlrsMopD51B8UUhQTP3hZZFhEZH31f+pgYgEtpm5B0DDhvfBj
 ZNbGfr7bb5DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; d="scan'208";a="382433255"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.249.172.204])
 ([10.249.172.204])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2020 00:20:03 -0700
Subject: Re: [Issue]platform/x86: iommu: System can't shutdown because iommu
 driver keeps checking the status of DMA_GSTS_TES
To: Koba Ko <koba.ko@canonical.com>, David Woodhouse <dwmw2@infradead.org>,
 Joerg Roedel <joro@8bytes.org>
References: <CAJB-X+Ww=bZN2qZ=e=4EkN_RUTiZxHxkdnHh50y9iVqZmT_XQg@mail.gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <111dde48-8018-6d74-5df8-1534143f4de6@linux.intel.com>
Date: Mon, 15 Jun 2020 15:20:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAJB-X+Ww=bZN2qZ=e=4EkN_RUTiZxHxkdnHh50y9iVqZmT_XQg@mail.gmail.com>
Content-Language: en-US
Cc: "Sun, Jian" <jian.sun@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Kai Heng Feng <kai.heng.feng@canonical.com>
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

SGkgS29iYSBLbywKCk9uIDIwMjAvNi8xNSAxMToxOSwgS29iYSBLbyB3cm90ZToKPiBoaSBBbGws
Cj4gSSBoYXZlIGEgbWFjaGluZSBhbmQgdGhlcmUncyBvbmx5IGludGVsIGdwdS4KPiB0aGUgc2Vj
dXJlYm9vdMKgYW5kIHZ0LWQgaXMgZW5hYmxlZMKgaW4gQklPUy4KPiBPbiB0aGUgVWJ1bnR1IGRl
c2t0b3AsIEkgZG8gczJpZGxlIGZpcnN0IGFuZCByZXN0YXJ0IHRoZSBtYWNoaW5lLgo+IFRoZSBt
YWNoaW5lIGNhbid0IHJlc3RhcnQgc3VjY2Vzc2Z1bGx5LCBzbyBJIG5lZWQgdG8gcHJlc3MgdGhl
IAo+IHBvd2VywqBidXR0b24gdG8gc2h1dGRvd24uCj4gSSB0cmllZMKgIGVhY2ggb2YgdGhlIGZv
bGxvd2luZyBhbmQgdGhlIGlzc3VlIGNhbid0IGJlIHRyaWdnZXJlZC4KPiAxLiBkaXNhYmxlIHNl
Y3VyZSBib290wqBpbiBCSU9TLgo+IDIuIGludGVsX2lvbW11PW9mZi4KPiAzLiBpbnRlbF9pb21t
PWlnZnhfb2ZmLgo+IDQuIG5vbW9kZXNldAo+IDUuIGk5MTUubW9kZXNldD0wLgo+IAo+IEFmdGVy
IEkgaW52ZXN0aWdhdGUgZnVydGhlciwgZmluZCBpbnRlX2lvbW11IGtlZXBzIGNoZWNraW5nIHRo
ZSBzdGF0dXMgCj4gb2YgRE1BX0dTVFNfVEVTLgo+IER1cmluZyB0aGUgcHJvY2VkdXJlIG9mIHJl
c3RhcnQsIHRoZSBkcml2ZXIgd291bGQgZGlzYWJsZcKgaW9tbXUgCj4gdHJhbnNsYXRpb24gYW5k
Cj4gY2hlY2sgc3RhdHVzIG9mIERNQV9HU1RTX1RFUyB1bnRpbCBzdGF0dXMgb2YgRE1BX0dTVFNf
VEVTIGlzIDAuCj4gCj4gSWYgeW91IG5lZWQgbW9yZSBpbmZvcm1hdGlvbiwgSSBjYW4gcHJvdmlk
ZSBpdC4KCkRvIHlvdSBtaW5kIHRlbGxpbmcgd2hhdCBwbGF0Zm9ybSBpcyBpdD8KCkJlc3QgcmVn
YXJkcywKYmFvbHUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
