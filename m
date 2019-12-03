Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33810FB33
	for <lists.iommu@lfdr.de>; Tue,  3 Dec 2019 10:56:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78A618659E;
	Tue,  3 Dec 2019 09:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1bwb2mhxYPW; Tue,  3 Dec 2019 09:56:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF4EF865AB;
	Tue,  3 Dec 2019 09:56:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5D45C087F;
	Tue,  3 Dec 2019 09:56:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D6C9C087F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 09:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 072AA865A5
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 09:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIG8Fa1RJ-C7 for <iommu@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 09:56:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CF98A86594
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575367003;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ls4NWyJwE+dLE6QN0p+nNRdRnU/rX0zjZf4pYzUS9jo=;
 b=OHa4DbwmRQ9lwZGU5Djcr2CIesVpl66C+wtjvIcUjSZ6bVpYHJXBZUpSQZ/I/WmQJvH2KM
 GITJFKXjXQVwNb/G7UHR3c9rhE6HpTYahxLiuBavjker5FlGBh2bBKUtN3L6d83/mxCx+w
 yzSmPU3z++q9L9zAUOuQxssXXUUcFOc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-Qh4zWy5UNU2B6nvhAXMQCw-1; Tue, 03 Dec 2019 04:56:40 -0500
Received: by mail-pf1-f199.google.com with SMTP id x199so1900355pfc.10
 for <iommu@lists.linux-foundation.org>; Tue, 03 Dec 2019 01:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ZaWPs6AOz6dMjK3qk7RdshArf3yLVN4TistcpLdTrqg=;
 b=KiwqD4uAfuydVtz/ayszPNqh3JjbTPZvgUWJTM9Cok3914B4wMTgsbPyUWK8OHMYpy
 wmhr5Sh0sCb1dCZ9awTZP4VwibOqgIyZd9SE1Sr04v41IKg0kw0H7u00i4FttGvvfDz3
 n4k0EdfNl6vNSR9zafOktxilJb4SPZc3nFhVxSj8L+U3KhAyhRrefPpD6URUUkw+wQaf
 s0CMSciY4U2hRPmb89hvi+8haRQawbLR1hrtAbGqngRZm34Wpo1aFz2SoN9zfr1BYHgg
 +Xf4Tm+wJyduPqGq7GXaYv58uPXK7cqcVMqmcgBzWHuL1YwuWa5Jp75cwciVMh21fb8r
 dM6g==
X-Gm-Message-State: APjAAAV/pSH+d/DkZatIdhD+k5wBk0bcxL0ssoJRyqSY+/zDatEuKP6T
 2BJwZrve4GhniN2GZpkPZvTFX20NWbomeKlVoDfXSU73BJem8LwyQ3BJbSGsnF+OAdDbfhjbrpM
 ndKcu8DeWspEpAxyKEMHDdRm1ZCa+vg==
X-Received: by 2002:aa7:80d2:: with SMTP id a18mr3899277pfn.29.1575366998868; 
 Tue, 03 Dec 2019 01:56:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqyN9mt2wkHUD9Skqc88Qx1wclmGnRA1yyq6n8NM3tt6OjT3UapCsaUDLyqD/qukxZEoSbrs4Q==
X-Received: by 2002:aa7:80d2:: with SMTP id a18mr3899256pfn.29.1575366998558; 
 Tue, 03 Dec 2019 01:56:38 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id a3sm2292179pjh.31.2019.12.03.01.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 01:56:37 -0800 (PST)
Date: Tue, 3 Dec 2019 02:56:36 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: dmar pte read access not set error messages on hp dl388 gen8
 systems
Message-ID: <20191203095636.epmuinnrpykecfda@cantor>
References: <20191202063422.3lyfoerkejig4num@cantor>
 <702d8a8a-88de-bffb-911e-9eb9a6a7845d@linux.intel.com>
 <20191202071406.jpq5qobbtnwhktlc@cantor>
 <20191202161332.ctc3y5cvdgqwnz7l@cantor>
 <14bbe41c-61e9-d2b6-31cb-67c0b1ad11da@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <14bbe41c-61e9-d2b6-31cb-67c0b1ad11da@linux.intel.com>
X-MC-Unique: Qh4zWy5UNU2B6nvhAXMQCw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: iommu@lists.linux-foundation.org
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gVHVlIERlYyAwMyAxOSwgTHUgQmFvbHUgd3JvdGU6Cj5IaSwKPgo+T24gMTIvMy8xOSAxMjox
MyBBTSwgSmVycnkgU25pdHNlbGFhciB3cm90ZToKPj5PbiBNb24gRGVjIDAyIDE5LCBKZXJyeSBT
bml0c2VsYWFyIHdyb3RlOgo+Pj5PbiBNb24gRGVjIDAyIDE5LCBMdSBCYW9sdSB3cm90ZToKPj4+
PkhpLAo+Pj4+Cj4+Pj5PbiAxMi8yLzE5IDI6MzQgUE0sIEplcnJ5IFNuaXRzZWxhYXIgd3JvdGU6
Cj4+Pj4+V2UgYXJlIHNlZWluZyBETUFSIFBURSByZWFkIGFjY2VzcyBub3Qgc2V0IGVycm9ycyB3
aGVuIGJvb3RpbmcgYQo+Pj4+Pmtlcm5lbCB3aXRoIGRlZmF1bHQgcGFzc3Rocm91Z2gsIGJvdGgg
d2l0aCBhIHRlc3Qga2VybmVsIGFuZCB3aXRoCj4+Pj4+YSA1LjQuMCBrZXJuZWwuIFByZXZpb3Vz
bHkgd2Ugd291bGQgc2VlIGEgbnVtYmVyIG9mIGlkZW50aXR5IG1hcHBpbmdzCj4+Pj4+YmVpbmcg
c2V0IHJlbGF0ZWQgdG8gdGhlIHJtcnJzLCBhbmQgbm93IHRoZXkgYXJlbid0IHNlZW4gYW5kIHdl
IGdldAo+Pj4+PnRoZSBkbWFyIHB0ZSBlcnJvcnMgYXMgZGV2aWNlcyB0b3VjaCB0aG9zZSByZWdp
b25zLiBGcm9tIHdoYXQgCj4+Pj4+SSBjYW4gdGVsbAo+Pj4+PmN1cnJlbnRseSBkZjRmM2M2MDNh
ZWIgKCJpb21tdS92dC1kOiBSZW1vdmUgc3RhdGljIGlkZW50aXR5IG1hcCBjb2RlIikKPj4+Pj5y
ZW1vdmVkIHRoZSBiaXQgb2YgY29kZSBpbiBpbml0X2RtYXJzIHRoYXQgdXNlZCB0byBzZXQgdXAg
dGhvc2UKPj4+Pj5tYXBwaW5nczoKPj4+Pj4KPj4+Pj4twqDCoMKgwqDCoMKgIC8qCj4+Pj4+LcKg
wqDCoMKgwqDCoMKgICogRm9yIGVhY2ggcm1ycgo+Pj4+Pi3CoMKgwqDCoMKgwqDCoCAqwqDCoCBm
b3IgZWFjaCBkZXYgYXR0YWNoZWQgdG8gcm1ycgo+Pj4+Pi3CoMKgwqDCoMKgwqDCoCAqwqDCoCBk
bwo+Pj4+Pi3CoMKgwqDCoMKgwqDCoCAqwqDCoMKgwqAgbG9jYXRlIGRyaGQgZm9yIGRldiwgYWxs
b2MgZG9tYWluIGZvciBkZXYKPj4+Pj4twqDCoMKgwqDCoMKgwqAgKsKgwqDCoMKgIGFsbG9jYXRl
IGZyZWUgZG9tYWluCj4+Pj4+LcKgwqDCoMKgwqDCoMKgICrCoMKgwqDCoCBhbGxvY2F0ZSBwYWdl
IHRhYmxlIGVudHJpZXMgZm9yIHJtcnIKPj4+Pj4twqDCoMKgwqDCoMKgwqAgKsKgwqDCoMKgIGlm
IGNvbnRleHQgbm90IGFsbG9jYXRlZCBmb3IgYnVzCj4+Pj4+LcKgwqDCoMKgwqDCoMKgICrCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhbGxvY2F0ZSBhbmQgaW5pdCBjb250ZXh0Cj4+Pj4+LcKgwqDCoMKg
wqDCoMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXQgcHJlc2VudCBpbiByb290IHRhYmxlIGZv
ciB0aGlzIGJ1cwo+Pj4+Pi3CoMKgwqDCoMKgwqDCoCAqwqDCoMKgwqAgaW5pdCBjb250ZXh0IHdp
dGggZG9tYWluLCB0cmFuc2xhdGlvbiBldGMKPj4+Pj4twqDCoMKgwqDCoMKgwqAgKsKgwqDCoCBl
bmRmb3IKPj4+Pj4twqDCoMKgwqDCoMKgwqAgKiBlbmRmb3IKPj4+Pj4twqDCoMKgwqDCoMKgwqAg
Ki8KPj4+Pj4twqDCoMKgwqDCoMKgIHByX2luZm8oIlNldHRpbmcgUk1SUjpcbiIpOwo+Pj4+Pi3C
oMKgwqDCoMKgwqAgZm9yX2VhY2hfcm1ycl91bml0cyhybXJyKSB7Cj4+Pj4+LcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogc29tZSBCSU9TIGxpc3RzIG5vbi1leGlzdCBkZXZpY2VzIGlu
IERNQVIgdGFibGUuICovCj4+Pj4+LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yX2Vh
Y2hfYWN0aXZlX2Rldl9zY29wZShybXJyLT5kZXZpY2VzLCAKPj4+Pj5ybXJyLT5kZXZpY2VzX2Nu
dCwKPj4+Pj4twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaSwgZGV2KSB7Cj4+Pj4+LcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGlvbW11X3ByZXBhcmVf
cm1ycl9kZXYocm1yciwgZGV2KTsKPj4+Pj4twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+Pj4twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigiTWFwcGluZyByZXNlcnZl
ZCAKPj4+Pj5yZWdpb24gZmFpbGVkXG4iKTsKPj4+Pj4twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+Pj4+LcKgwqDCoMKgwqDCoCB9Cj4+Pj4+Cj4+Pj4+c2lfZG9tYWluX2luaXQgbm93
IGhhcyBjb2RlIHRoYXQgc2V0cyBpZGVudGl0eSBtYXBzIGZvciAKPj4+Pj5kZXZpY2VzIGluIHJt
cnJzLCBidXQKPj4+Pj5vbmx5IGZvciBjZXJ0YWluIGRldmljZXMuCj4+Pj4KPj4+Pk9uIHdoaWNo
IGRldmljZSwgYXJlIHlvdSBzZWVpbmcgdGhpcyBlcnJvcj8gSXMgaXQgYSBybXJyIGxvY2tlZCBk
ZXZpY2U/Cj4+Pj4KPj4+PkJlc3QgcmVnYXJkcywKPj4+PmJhb2x1Cj4+Pj4KPj4+Cj4+PkFsbW9z
dCBhbGwgb2YgdGhlIG1lc3NhZ2VzIGFyZSBmb3IgdGhlIGlsbywgYnV0IHRoZXJlIGFsc28gaXMg
YSAKPj4+bWVzc2FnZSBmb3IKPj4+dGhlIHNtYXJ0IGFycmF5IHJhaWQgYnVzIGNvbnRyb2xsZXIu
Cj4+Pgo+Pgo+PkFsc28gc2VlaW5nIGl0IHdpdGggYSBkbDM4MCBnZW45IHN5c3RlbSwgd2hlcmUg
dGhlIHJhaWQgYnVzIGNvbnRyb2xsZXIKPj5pcyBnZXR0aW5nIHRoZSBlcnJvci4KPgo+RG9lcyBp
dCBoZWxwIGlmIHlvdSByZW1vdmUKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGRldmlj
ZV9pc19ybXJyX2xvY2tlZChkZXYpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPgo+aW4gc2lfZG9tYWluX2luaXQoKT8KPgoKVW5mb3J0dW5hdGVseSBpdCBzdGls
bCBzcGl0cyBvdXQgYSBidW5jaCBvZiBlcnJvciBtZXNzYWdlcy4KCj5CZXN0IHJlZ2FyZHMsCj5i
YW9sdQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
b21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
