Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D51ABA36
	for <lists.iommu@lfdr.de>; Thu, 16 Apr 2020 09:45:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58E7B8758C;
	Thu, 16 Apr 2020 07:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPsD+OZDucS8; Thu, 16 Apr 2020 07:45:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2EAFB86DDC;
	Thu, 16 Apr 2020 07:45:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDED5C1D88;
	Thu, 16 Apr 2020 07:45:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C19BAC0172
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 07:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A928386257
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 07:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPnT-2xRxRWE for <iommu@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 07:45:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EAB3486250
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587023142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtMw61WExPfRdJ7k/9e2uGO0mShWA0MWE6V5DxSJKqU=;
 b=i+G/8B+LndcvuUIqQdKBrI4GZL1jtZ6CTu+DL/h6yBNydVgnq5V2kcb77kLQ4A7WZbGedH
 lEHOvUzLDW4hWnGrPxMBJSgtyIzh3jrWpdcOQjAlfOkAqmrtQLSg8FnscRDejq031V/M0+
 fZJZBuhG309cxzchzwSuj6aWPFKhSTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-UyxvZ--jPOSsOW2DrZQkxw-1; Thu, 16 Apr 2020 03:45:35 -0400
X-MC-Unique: UyxvZ--jPOSsOW2DrZQkxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7354A8017F5;
 Thu, 16 Apr 2020 07:45:32 +0000 (UTC)
Received: from [10.36.115.53] (ovpn-115-53.ams2.redhat.com [10.36.115.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 943CE60BE0;
 Thu, 16 Apr 2020 07:45:25 +0000 (UTC)
Subject: Re: [PATCH v11 00/13] SMMUv3 Nested Stage Setup (IOMMU part)
To: Zhangfei Gao <zhangfei.gao@linaro.org>, eric.auger.pro@gmail.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, will@kernel.org,
 joro@8bytes.org, maz@kernel.org, robin.murphy@arm.com
References: <20200414150607.28488-1-eric.auger@redhat.com>
 <eb27f625-ad7a-fcb5-2185-5471e4666f09@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <06fe02f7-2556-8986-2f1e-dcdf59773b8c@redhat.com>
Date: Thu, 16 Apr 2020 09:45:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <eb27f625-ad7a-fcb5-2185-5471e4666f09@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org,
 alex.williamson@redhat.com, bbhushan2@marvell.com
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

SGkgWmhhbmdmZWksCgpPbiA0LzE2LzIwIDY6MjUgQU0sIFpoYW5nZmVpIEdhbyB3cm90ZToKPiAK
PiAKPiBPbiAyMDIwLzQvMTQg5LiL5Y2IMTE6MDUsIEVyaWMgQXVnZXIgd3JvdGU6Cj4+IFRoaXMg
dmVyc2lvbiBmaXhlcyBhbiBpc3N1ZSBvYnNlcnZlZCBieSBTaGFtZWVyIG9uIGFuIFNNTVUgMy4y
LAo+PiB3aGVuIG1vdmluZyBmcm9tIGR1YWwgc3RhZ2UgY29uZmlnIHRvIHN0YWdlIDEgb25seSBj
b25maWcuCj4+IFRoZSAyIGhpZ2ggNjRiIG9mIHRoZSBTVEUgbm93IGdldCByZXNldC4gT3RoZXJ3
aXNlLCBsZWF2aW5nIHRoZQo+PiBTMlRUQiBzZXQgbWF5IGNhdXNlIGEgQ19CQURfU1RFIGVycm9y
Lgo+Pgo+PiBUaGlzIHNlcmllcyBjYW4gYmUgZm91bmQgYXQ6Cj4+IGh0dHBzOi8vZ2l0aHViLmNv
bS9lYXVnZXIvbGludXgvdHJlZS92NS42LTJzdGFnZS12MTFfMTAuMQo+PiAoaW5jbHVkaW5nIHRo
ZSBWRklPIHBhcnQpCj4+IFRoZSBRRU1VIGZlbGxvdyBzZXJpZXMgc3RpbGwgY2FuIGJlIGZvdW5k
IGF0Ogo+PiBodHRwczovL2dpdGh1Yi5jb20vZWF1Z2VyL3FlbXUvdHJlZS92NC4yLjAtMnN0YWdl
LXJmY3Y2Cj4+Cj4+IFVzZXJzIGhhdmUgZXhwcmVzc2VkIGludGVyZXN0IGluIHRoYXQgd29yayBh
bmQgdGVzdGVkIHY5L3YxMDoKPj4gLSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVy
LzExMDM5OTk1LyMyMzAxMjM4MQo+PiAtIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292
ZXIvMTEwMzk5OTUvIzIzMTk3MjM1Cj4+Cj4+IEJhY2tncm91bmQ6Cj4+Cj4+IFRoaXMgc2VyaWVz
IGJyaW5ncyB0aGUgSU9NTVUgcGFydCBvZiBIVyBuZXN0ZWQgcGFnaW5nIHN1cHBvcnQKPj4gaW4g
dGhlIFNNTVV2My4gVGhlIFZGSU8gcGFydCBpcyBzdWJtaXR0ZWQgc2VwYXJhdGVseS4KPj4KPj4g
VGhlIElPTU1VIEFQSSBpcyBleHRlbmRlZCB0byBzdXBwb3J0IDIgbmV3IEFQSSBmdW5jdGlvbmFs
aXRpZXM6Cj4+IDEpIHBhc3MgdGhlIGd1ZXN0IHN0YWdlIDEgY29uZmlndXJhdGlvbgo+PiAyKSBw
YXNzIHN0YWdlIDEgTVNJIGJpbmRpbmdzCj4+Cj4+IFRoZW4gdGhvc2UgY2FwYWJpbGl0aWVzIGdl
dHMgaW1wbGVtZW50ZWQgaW4gdGhlIFNNTVV2MyBkcml2ZXIuCj4+Cj4+IFRoZSB2aXJ0dWFsaXpl
ciBwYXNzZXMgaW5mb3JtYXRpb24gdGhyb3VnaCB0aGUgVkZJTyB1c2VyIEFQSQo+PiB3aGljaCBj
YXNjYWRlcyB0aGVtIHRvIHRoZSBpb21tdSBzdWJzeXN0ZW0uIFRoaXMgYWxsb3dzIHRoZSBndWVz
dAo+PiB0byBvd24gc3RhZ2UgMSB0YWJsZXMgYW5kIGNvbnRleHQgZGVzY3JpcHRvcnMgKHNvLWNh
bGxlZCBQQVNJRAo+PiB0YWJsZSkgd2hpbGUgdGhlIGhvc3Qgb3ducyBzdGFnZSAyIHRhYmxlcyBh
bmQgbWFpbiBjb25maWd1cmF0aW9uCj4+IHN0cnVjdHVyZXMgKFNURSkuCj4+Cj4+Cj4gCj4gVGhh
bmtzIEVyaWMKPiAKPiBUZXN0ZWQgdjExIG9uIEhpc2lsaWNvbiBrdW5wZW5nOTIwIGJvYXJkIHZp
YSBoYXJkd2FyZSB6aXAgYWNjZWxlcmF0b3IuCj4gMS4gbm8tc3ZhIHdvcmtzLCB3aGVyZSBndWVz
dCBhcHAgZGlyZWN0bHkgdXNlIHBoeXNpY2FsIGFkZHJlc3MgdmlhIGlvY3RsLgpUaGFuayB5b3Ug
Zm9yIHRoZSB0ZXN0aW5nLiBHbGFkIGl0IHdvcmtzIGZvciB5b3UuCj4gMi4gdlNWQSBzdGlsbCBu
b3Qgd29yaywgc2FtZSBhcyB2MTAsClllcyB0aGF0J3Mgbm9ybWFsIHRoaXMgc2VyaWVzIGlzIG5v
dCBtZWFudCB0byBzdXBwb3J0IHZTVk0gYXQgdGhpcyBzdGFnZS4KCkkgaW50ZW5kIHRvIGFkZCB0
aGUgbWlzc2luZyBwaWVjZXMgZHVyaW5nIHRoZSBuZXh0IHdlZWtzLgoKVGhhbmtzCgpFcmljCj4g
My7CoCB0aGUgdjEwIGlzc3VlIHJlcG9ydGVkIGJ5IFNoYW1lZXIgaGFzIGJlZW4gc29sdmVkLMKg
IGZpcnN0IHN0YXJ0IHFlbXUKPiB3aXRowqAgaW9tbXU9c21tdXYzLCB0aGVuIHN0YXJ0IHFlbXUg
d2l0aG91dMKgIGlvbW11PXNtbXV2Mwo+IDQuIG5vLXN2YSBhbHNvIHdvcmtzIHdpdGhvdXTCoCBp
b21tdT1zbW11djMKPiAKPiBUZXN0IGRldGFpbHMgaW4gaHR0cHM6Ly9kb2NzLnFxLmNvbS9kb2Mv
RFJVNW9SMU50VUVSc2VGTkwKPiAKPiBUaGFua3MKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9pb21tdQ==
