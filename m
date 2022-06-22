Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 477115543B1
	for <lists.iommu@lfdr.de>; Wed, 22 Jun 2022 09:55:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3840142454;
	Wed, 22 Jun 2022 07:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3840142454
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60N26FjLfGGj; Wed, 22 Jun 2022 07:55:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 173AB4244F;
	Wed, 22 Jun 2022 07:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 173AB4244F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0042C0084;
	Wed, 22 Jun 2022 07:55:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2315C002D;
 Wed, 22 Jun 2022 07:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A2E640A02;
 Wed, 22 Jun 2022 07:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A2E640A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNPbu4zk_h7S; Wed, 22 Jun 2022 07:55:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F01340C6F
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F01340C6F;
 Wed, 22 Jun 2022 07:55:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC87913D5;
 Wed, 22 Jun 2022 00:54:56 -0700 (PDT)
Received: from [10.57.85.1] (unknown [10.57.85.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E50B3F66F;
 Wed, 22 Jun 2022 00:54:50 -0700 (PDT)
Message-ID: <6e1280c5-4b22-ebb3-3912-6c72bc169982@arm.com>
Date: Wed, 22 Jun 2022 08:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/5] vfio/iommu_type1: Remove the domain->ops comparison
Content-Language: en-GB
To: Nicolin Chen <nicolinc@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
 <20220616000304.23890-4-nicolinc@nvidia.com>
 <BL1PR11MB52717050DBDE29A81637BBFA8CAC9@BL1PR11MB5271.namprd11.prod.outlook.com>
 <YqutYjgtFOTXCF0+@Asurada-Nvidia>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YqutYjgtFOTXCF0+@Asurada-Nvidia>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
 "jordan@cosmicpenguin.net" <jordan@cosmicpenguin.net>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "saiprakash.ranjan@codeaurora.org" <saiprakash.ranjan@codeaurora.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "isaacm@codeaurora.org" <isaacm@codeaurora.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
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

T24gMjAyMi0wNi0xNiAyMzoyMywgTmljb2xpbiBDaGVuIHdyb3RlOgo+IE9uIFRodSwgSnVuIDE2
LCAyMDIyIGF0IDA2OjQwOjE0QU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOgo+IAo+Pj4gVGhl
IGRvbWFpbi0+b3BzIHZhbGlkYXRpb24gd2FzIGFkZGVkLCBhcyBhIHByZWNhdXRpb24sIGZvciBt
aXhlZC1kcml2ZXIKPj4+IHN5c3RlbXMuIEhvd2V2ZXIsIGF0IHRoaXMgbW9tZW50IG9ubHkgb25l
IGlvbW11IGRyaXZlciBpcyBwb3NzaWJsZS4gU28KPj4+IHJlbW92ZSBpdC4KPj4KPj4gSXQncyB0
cnVlIG9uIGEgcGh5c2ljYWwgcGxhdGZvcm0uIEJ1dCBJJ20gbm90IHN1cmUgd2hldGhlciBhIHZp
cnR1YWwgcGxhdGZvcm0KPj4gaXMgYWxsb3dlZCB0byBpbmNsdWRlIG11bHRpcGxlIGUuZy4gb25l
IHZpcnRpby1pb21tdSBhbG9uZ3NpZGUgYSB2aXJ0dWFsIFZULWQKPj4gb3IgYSB2aXJ0dWFsIHNt
bXUuIEl0IG1pZ2h0IGJlIGNsZWFyZXIgdG8gY2xhaW0gdGhhdCAoYXMgUm9iaW4gcG9pbnRlZCBv
dXQpCj4+IHRoZXJlIGlzIHBsZW50eSBtb3JlIHNpZ25pZmljYW50IHByb2JsZW1zIHRoYW4gdGhp
cyB0byBzb2x2ZSBpbnN0ZWFkIG9mIHNpbXBseQo+PiBzYXlpbmcgdGhhdCBvbmx5IG9uZSBpb21t
dSBkcml2ZXIgaXMgcG9zc2libGUgaWYgd2UgZG9uJ3QgaGF2ZSBleHBsaWNpdCBjb2RlCj4+IHRv
IHJlamVjdCBzdWNoIGNvbmZpZ3VyYXRpb24uIPCfmIoKPiAKPiBXaWxsIGVkaXQgdGhpcyBwYXJ0
LiBUaGFua3MhCgpPaCwgcGh5c2ljYWwgcGxhdGZvcm1zIHdpdGggbWl4ZWQgSU9NTVVzIGRlZmlu
aXRlbHkgZXhpc3QgYWxyZWFkeS4gVGhlIAptYWluIHBvaW50IGlzIHRoYXQgd2hpbGUgYnVzX3Nl
dF9pb21tdSBzdGlsbCBleGlzdHMsIHRoZSBjb3JlIGNvZGUgCmVmZmVjdGl2ZWx5ICpkb2VzKiBw
cmV2ZW50IG11bHRpcGxlIGRyaXZlcnMgZnJvbSByZWdpc3RlcmluZyAtIGV2ZW4gaW4gCmVtdWxh
dGVkIGNhc2VzIGxpa2UgdGhlIGV4YW1wbGUgYWJvdmUsIHZpcnRpby1pb21tdSBhbmQgVlQtZCB3
b3VsZCBib3RoIAp0cnkgdG8gYnVzX3NldF9pb21tdSgmcGNpX2J1c190eXBlKSwgYW5kIG9uZSBv
ZiB0aGVtIHdpbGwgbG9zZS4gVGhlIAphc3BlY3Qgd2hpY2ggbWlnaHQgd2FycmFudCBjbGFyaWZp
Y2F0aW9uIGlzIHRoYXQgdGhlcmUncyBubyBjb21iaW5hdGlvbiAKb2Ygc3VwcG9ydGVkIGRyaXZl
cnMgd2hpY2ggY2xhaW0gbm9uLW92ZXJsYXBwaW5nIGJ1c2VzICphbmQqIGNvdWxkIAphcHBlYXIg
aW4gdGhlIHNhbWUgc3lzdGVtIC0gZXZlbiBpZiB5b3UgdHJpZWQgdG8gY29udHJpdmUgc29tZXRo
aW5nIGJ5IAplbXVsYXRpbmcsIHNheSwgVlQtZCAoUENJKSBhbG9uZ3NpZGUgcm9ja2NoaXAtaW9t
bXUgKHBsYXRmb3JtKSwgeW91IApjb3VsZCBzdGlsbCBvbmx5IGRlc2NyaWJlIG9uZSBvciB0aGUg
b3RoZXIgZHVlIHRvIEFDUEkgdnMuIERldmljZXRyZWUuCgpUaGFua3MsClJvYmluLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxp
c3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
