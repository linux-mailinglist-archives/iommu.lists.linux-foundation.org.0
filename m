Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 48790115AB9
	for <lists.iommu@lfdr.de>; Sat,  7 Dec 2019 03:29:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C77A987729;
	Sat,  7 Dec 2019 02:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4c2NDGTqR27; Sat,  7 Dec 2019 02:29:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F3DEB87728;
	Sat,  7 Dec 2019 02:29:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA124C077D;
	Sat,  7 Dec 2019 02:29:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1731AC077D
 for <iommu@lists.linux-foundation.org>; Sat,  7 Dec 2019 02:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00CA38771A
 for <iommu@lists.linux-foundation.org>; Sat,  7 Dec 2019 02:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDF2jFgJLPlO for <iommu@lists.linux-foundation.org>;
 Sat,  7 Dec 2019 02:29:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BAFA08770C
 for <iommu@lists.linux-foundation.org>; Sat,  7 Dec 2019 02:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575685760;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rwncq8+U/eCWEIj3yEwUO51o+C1gOIRJT+PVLfwFSKs=;
 b=Qej85uo9NqDKlHLfPltvXZJJGHWqT6wq16XpbGIn1gpvZOWdYuClxBS1+1eRIb9SR90ySV
 16LXHgIkZOgx3shWQ6lKVDZ8wwalPE6iyNPtB8QrkNe+c8RtWZ/ZHgV8sagg4zrOw/SGmI
 s3GF6BMb+qDLTuf3oxZqw/AbfsvFTGM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-7a_V9xOdN26MzO_LBBdU0g-1; Fri, 06 Dec 2019 21:29:18 -0500
Received: by mail-pj1-f69.google.com with SMTP id n89so4589055pji.6
 for <iommu@lists.linux-foundation.org>; Fri, 06 Dec 2019 18:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=7em+g24p86dPShUMn7OH9qHfsZXrjrmKRsSFX0kXhSg=;
 b=GVZ0YtrEKpm5m/m4s31FfcHTX3q1hktaPhUIdjmemIiymsLdiQkyRPzNdj0+ki7bvC
 o4pqWHJ7729N+H339kfyuPn+edykihIdW8un3PYfkYeSFSUUAWzQe222XV5SkM0Xt5rO
 fgwYalJDqeDpCVFhIikoOM3pK3LveHS7yJCNOyLfUnu9Gv0mNWta7zWL0HV3/wCIlmJM
 W/ul0C80DhsOVwporw0hC7qpQ3BrpQSV7gyTBt1odiBXgHCxS3iQ9d+pejB+iUPiOBAn
 C2mYqq21Y7eeZE9Gj4HcXQKuKcAOANjxkx69deWJIdGWiSg5mjuwfpDmc4U9Zcj9AHTZ
 qRmw==
X-Gm-Message-State: APjAAAWgs2qZHGs3CDIeCHaLWKXCm6FJFjRorJ9pZkfeeF6FzhauMmQ+
 IhJ1ub8gPIOG5mc3JZHUO4TV7l1s+18pJVaFYYY3HW5/0mlaBWg+2J+S9d7GP03IvAmY0+bIv3P
 Fo922bylT4Ic905SqcFGvQ1no8rruxw==
X-Received: by 2002:a65:408d:: with SMTP id t13mr6914539pgp.441.1575685757685; 
 Fri, 06 Dec 2019 18:29:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEybnXMlEOfDe1+Ry5wIscbTckSgZZXB2tcNTz7VnOQFNbMyrFecCNnqudH8tm0CsFngxitw==
X-Received: by 2002:a65:408d:: with SMTP id t13mr6914512pgp.441.1575685757121; 
 Fri, 06 Dec 2019 18:29:17 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id l11sm17349333pff.120.2019.12.06.18.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 18:29:16 -0800 (PST)
Date: Fri, 6 Dec 2019 19:29:14 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: dmar pte read access not set error messages on hp dl388 gen8
 systems
Message-ID: <20191207022914.7uccwkmgadz4hvbf@cantor>
References: <20191203095636.epmuinnrpykecfda@cantor>
 <5ce8d57e-25f0-5d28-7408-92c650ba54aa@linux.intel.com>
 <20191204205300.4jiexjqfpnqlcagu@cantor>
 <2d4e0c05-f0ee-d4b1-d2ed-24197811b097@linux.intel.com>
 <20191205022551.janpwjvr4kei5r7c@cantor>
 <d5981dee-d37b-a725-ed94-8864f3dd7602@linux.intel.com>
 <20191205025320.oiulo3msfcggdlv5@cantor>
 <d5fbedce-7a06-79b4-75fa-0aa3cc3ef73b@linux.intel.com>
 <20191206072453.5jjwrjedqbjimx45@cantor>
 <0f82007e-9887-d6b2-08e5-9c430c920b36@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <0f82007e-9887-d6b2-08e5-9c430c920b36@linux.intel.com>
X-MC-Unique: 7a_V9xOdN26MzO_LBBdU0g-1
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

T24gU2F0IERlYyAwNyAxOSwgTHUgQmFvbHUgd3JvdGU6Cj5IaSBKZXJyeSwKPgo+T24gMTIvNi8x
OSAzOjI0IFBNLCBKZXJyeSBTbml0c2VsYWFyIHdyb3RlOgo+Pk9uIEZyaSBEZWMgMDYgMTksIEx1
IEJhb2x1IHdyb3RlOgo+PltzbmlwXQo+Pj4KPj4+Q2FuIHlvdSBwbGVhc2UgdHJ5IGJlbG93IGNo
YW5nZT8gTGV0J3MgY2hlY2sgd2hldGhlciB0aGUgYWZlbmRpbmcKPj4+YWRkcmVzcyBoYXMgYmVl
biBtYXBwZWQgZm9yIGRldmljZSAwMS4wMC4yLgo+Pj4KPj4+JCBnaXQgZGlmZgo+Pj5kaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9pb21tdS5jIGIvZHJpdmVycy9pb21tdS9pb21tdS5jCj4+Pmlu
ZGV4IGRiN2JmZDRmMmQyMC4uZDlkYWY2NmJlODQ5IDEwMDY0NAo+Pj4tLS0gYS9kcml2ZXJzL2lv
bW11L2lvbW11LmMKPj4+KysrIGIvZHJpdmVycy9pb21tdS9pb21tdS5jCj4+PkBAIC02NjMsNiAr
NjYzLDggQEAgc3RhdGljIGludCAKPj4+aW9tbXVfZ3JvdXBfY3JlYXRlX2RpcmVjdF9tYXBwaW5n
cyhzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdyb3VwLAo+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBpb21tdV9tYXAoZG9tYWluLCBhZGRyLCBhZGRyLCAK
Pj4+cGdfc2l6ZSwgZW50cnktPnByb3QpOwo+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+PisKPj4+K8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvKGRldiwgIlNl
dHRpbmcgaWRlbnRpdHkgbWFwIFsweCVMeCAKPj4+LSAweCVMeF0gZm9yIGdyb3VwICVkXG4iLCBh
ZGRyLCBhZGRyICsgcGdfc2l6ZSwgZ3JvdXAtPmlkKTsKPj4+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9Cj4+Pgo+Pj7CoMKgwqDCoMKgwqAgfQo+Pj4KPj4+SSBhbSBkb3VidGluZyB0aGF0
IGRldmljZSAwMS4wMC4yIGlzIG5vdCBpbiB0aGUgZGV2aWNlIHNjb3BlIG9mCj4+Pgo+Pj5bwqDC
oMKgIDQuNDg1MTA4XSBETUFSOiBSTVJSIGJhc2U6IDB4MDAwMDAwYmRmNmYwMDAgZW5kOiAweDAw
MDAwMGJkZjdlZmZmCj4+Pgo+Pj5CeSB0aGUgd2F5LCBkb2VzIGRldmljZSAwMS4wMC4yIHdvcmtz
IHdlbGwgYWZ0ZXIgYmluZGluZyB0aGUgZHJpdmVyPwo+Pj4KPj4KPj5XaGVuIEkgYm9vdCBpdCB3
aXRoIHBhc3N0aHJvdWdoIGl0IGRvZXNuJ3QgZ2V0IHRvIGEgcG9pbnQgd2hlcmUgSSBjYW4KPj5s
b2dpbi4gSSB0aGluayB0aGUgc2VyaWFsIGNvbnNvbGUgb24gdGhlc2Ugc3lzdGVtcyBpcyB0aWVk
IHRvIHRoZSBpbG8sCj4+c28gdGhlIGNvbnNlcnZlciBjb25uZWN0aW9uIGNvdWxkIGJlIG1ha2lu
ZyB0aGluZ3MKPj53b3JzZS4gVW5mb3J0dW5hdGVseSB0aGUgc3lzdGVtIGlzIHJlbW90ZS4gSSBz
aG91bGQgaGF2ZSBtb3JlIHRpbWUgbm93Cj4+dG8gZm9jdXMgb24gZGVidWdnaW5nIHRoaXMuCj4+
Cj4+QXR0YWNoaW5nIGNvbnNvbGUgb3V0cHV0IGZvciB0aGUgYWJvdmUgcGF0Y2guCj4KPkl0IHNl
ZW1zIHRoYXQgZGV2aWNlIDAxLjAwLjIgaXNuJ3QgaW4gdGhlIHNjb3BlIG9mIFJNUlIgW2Jhc2U6
Cj4weDAwMDAwMGJkZjZmMDAwIGVuZDogMHgwMDAwMDBiZGY3ZWZmZl0uIEJ1dCBpdCBzdGlsbCB0
cmllcyB0byBhY2Nlc3MKPnRoZSBhZGRyZXNzIHdpdGhpbiBpdCwgaGVuY2UgZmF1bHRzIGdlbmVy
YXRlZC4KPgo+WW91IGNhbiBjaGVjayBpdCB3aXRoIEFDUEkvRE1BUiB0YWJsZS4KPgo+QmVzdCBy
ZWdhcmRzLAo+YmFvbHUKPgoKSSBiZWxpZXZlIGl0IGlzIHRoZSAzcmQgZW5kcG9pbnQgZGV2aWNl
IGVudHJ5IGluIGRtYXIgZGF0YSBiZWxvdy4KU28gcXVlc3Rpb24gYWJvdXQgcmVxdWVzdF9kZWZh
dWx0X2RvbWFpbl9mb3JfZGV2LiBTaW5jZSBhIGRtYSBtYXBwaW5nCmlzIGFscmVhZHkgZG9uZSBm
b3IgMS4wMC4wLCBhbmQgdGhhdCBzZXRzIHRoZSBkZWZhdWx0X2RvbWFpbiBmb3IgdGhlCmdyb3Vw
IChJIHRoaW5rKSwgd29uJ3QgaXQgYmFpbCBvdXQgZm9yIDEuMDAuMiBhdCB0aGlzIGNoZWNrPwoK
CWlmIChncm91cC0+ZGVmYXVsdF9kb21haW4gJiYgZ3JvdXAtPmRlZmF1bHRfZG9tYWluLT50eXBl
ID09IHR5cGUpCgkJZ290byBvdXQ7CgoKb3V0cHV0IGZyb20gbHNwY2kgLXQ6CgogIFwtWzAwMDA6
MDBdLSstMDAuMAogICAgICAgICAgICAgICstMDEuMC1bMDhdLS0KICAgICAgICAgICAgICArLTAx
LjEtWzE0XS0tCiAgICAgICAgICAgICAgKy0wMi4wLVswM10tLSstMDAuMAogICAgICAgICAgICAg
IHwgICAgICAgICAgICArLTAwLjEKICAgICAgICAgICAgICB8ICAgICAgICAgICAgKy0wMC4yCiAg
ICAgICAgICAgICAgfCAgICAgICAgICAgIFwtMDAuMwogICAgICAgICAgICAgICstMDIuMS1bMTVd
LS0KICAgICAgICAgICAgICArLTAyLjItWzAyXS0tLS0wMC4wCiAgICAgICAgICAgICAgKy0wMi4z
LVsxNl0tLQogICAgICAgICAgICAgICstMDMuMC1bMDQtMDddLS0tLTAwLjAtWzA1LTA3XS0tKy0w
Mi4wLVswNl0tLSstMDAuMAogICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgIFwtMDAuMQogICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXC0wNC4wLVswN10tLSstMDAuMAogICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwtMDAuMQogICAgICAgICAgICAg
ICstMDMuMS1bMTddLS0KICAgICAgICAgICAgICArLTAzLjItWzE4XS0tCiAgICAgICAgICAgICAg
Ky0wMy4zLVsxOV0tLQogICAgICAgICAgICAgICstMDQuMAogICAgICAgICAgICAgICstMDQuMQog
ICAgICAgICAgICAgICstMDQuMgogICAgICAgICAgICAgICstMDQuMwogICAgICAgICAgICAgICst
MDQuNAogICAgICAgICAgICAgICstMDQuNQogICAgICAgICAgICAgICstMDQuNgogICAgICAgICAg
ICAgICstMDQuNwogICAgICAgICAgICAgICstMDUuMAogICAgICAgICAgICAgICstMDUuMgogICAg
ICAgICAgICAgICstMDUuNAogICAgICAgICAgICAgICstMTEuMC1bMWJdLS0KICAgICAgICAgICAg
ICArLTFhLjAKICAgICAgICAgICAgICArLTFjLjAtWzBiXS0tCiAgICAgICAgICAgICAgKy0xYy43
LVswMV0tLSstMDAuMAogICAgICAgICAgICAgIHwgICAgICAgICAgICArLTAwLjEKICAgICAgICAg
ICAgICB8ICAgICAgICAgICAgKy0wMC4yCiAgICAgICAgICAgICAgfCAgICAgICAgICAgIFwtMDAu
NAogICAgICAgICAgICAgICstMWQuMAogICAgICAgICAgICAgICstMWUuMC1bMWFdLS0KICAgICAg
ICAgICAgICArLTFmLjAKICAgICAgICAgICAgICBcLTFmLjIKCkRNQVIgdGFibGUgZW50cmllcyBm
b3IgdGhlIFJNUlI6CgpbMzAyaCAwNzcwICAgMl0gICAgICAgICAgICAgICAgU3VidGFibGUgVHlw
ZSA6IDAwMDEgW1Jlc2VydmVkIE1lbW9yeSBSZWdpb25dClszMDRoIDA3NzIgICAyXSAgICAgICAg
ICAgICAgICAgICAgICAgTGVuZ3RoIDogMDBDRQoKWzMwNmggMDc3NCAgIDJdICAgICAgICAgICAg
ICAgICAgICAgUmVzZXJ2ZWQgOiAwMDAwClszMDhoIDA3NzYgICAyXSAgICAgICAgICAgUENJIFNl
Z21lbnQgTnVtYmVyIDogMDAwMApbMzBBaCAwNzc4ICAgOF0gICAgICAgICAgICAgICAgIEJhc2Ug
QWRkcmVzcyA6IDAwMDAwMDAwQkRGNkYwMDAKWzMxMmggMDc4NiAgIDhdICAgICAgICAgIEVuZCBB
ZGRyZXNzIChsaW1pdCkgOiAwMDAwMDAwMEJERjdFRkZGCgpbMzFBaCAwNzk0ICAgMV0gICAgICAg
ICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbMzFCaCAw
Nzk1ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBBClszMUNoIDA3OTYgICAy
XSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMApbMzFFaCAwNzk4ICAgMV0gICAg
ICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwClszMUZoIDA3OTkgICAxXSAgICAgICAgICAg
ICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKClszMjBoIDA4MDAgICAyXSAgICAgICAgICAgICAgICAg
ICAgIFBDSSBQYXRoIDogMDIsMDIKClszMjJoIDA4MDIgICAyXSAgICAgICAgICAgICAgICAgICAg
IFBDSSBQYXRoIDogMDAsMDAKCgpbMzI0aCAwODA0ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2Nv
cGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbMzI1aCAwODA1ICAgMV0gICAgICAg
ICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBBClszMjZoIDA4MDYgICAyXSAgICAgICAgICAgICAg
ICAgICAgIFJlc2VydmVkIDogMDAwMApbMzI4aCAwODA4ICAgMV0gICAgICAgICAgICAgICBFbnVt
ZXJhdGlvbiBJRCA6IDAwClszMjloIDA4MDkgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVt
YmVyIDogMDAKClszMkFoIDA4MTAgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDog
MUMsMDcKClszMkNoIDA4MTIgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAs
MDAKCgpbMzJFaCAwODE0ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQ
Q0kgRW5kcG9pbnQgRGV2aWNlXQpbMzJGaCAwODE1ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5
IExlbmd0aCA6IDBBClszMzBoIDA4MTYgICAyXSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVk
IDogMDAwMApbMzMyaCAwODE4ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAw
ClszMzNoIDA4MTkgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKClszMzRo
IDA4MjAgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMUMsMDcKClszMzZoIDA4
MjIgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDIKCgpbMzM4aCAwODI0
ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2
aWNlXQpbMzM5aCAwODI1ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDA4Clsz
M0FoIDA4MjYgICAyXSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMApbMzNDaCAw
ODI4ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwClszM0RoIDA4MjkgICAx
XSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKClszM0VoIDA4MzAgICAyXSAgICAg
ICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMUYsMDIKCgpbMzQwaCAwODMyICAgMV0gICAgICAg
ICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbMzQxaCAw
ODMzICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDA4ClszNDJoIDA4MzQgICAy
XSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMApbMzQ0aCAwODM2ICAgMV0gICAg
ICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwClszNDVoIDA4MzcgICAxXSAgICAgICAgICAg
ICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKClszNDZoIDA4MzggICAyXSAgICAgICAgICAgICAgICAg
ICAgIFBDSSBQYXRoIDogMUYsMDUKCgpbMzQ4aCAwODQwICAgMV0gICAgICAgICAgICBEZXZpY2Ug
U2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbMzQ5aCAwODQxICAgMV0gICAg
ICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBBClszNEFoIDA4NDIgICAyXSAgICAgICAgICAg
ICAgICAgICAgIFJlc2VydmVkIDogMDAwMApbMzRDaCAwODQ0ICAgMV0gICAgICAgICAgICAgICBF
bnVtZXJhdGlvbiBJRCA6IDAwClszNERoIDA4NDUgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMg
TnVtYmVyIDogMDAKClszNEVoIDA4NDYgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRo
IDogMDIsMDAKClszNTBoIDA4NDggICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDog
MDAsMDAKCgpbMzUyaCAwODUwICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAx
IFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbMzUzaCAwODUxICAgMV0gICAgICAgICAgICAgICAgIEVu
dHJ5IExlbmd0aCA6IDBBClszNTRoIDA4NTIgICAyXSAgICAgICAgICAgICAgICAgICAgIFJlc2Vy
dmVkIDogMDAwMApbMzU2aCAwODU0ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6
IDAwClszNTdoIDA4NTUgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKClsz
NThoIDA4NTYgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDAKClszNUFo
IDA4NTggICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDEKCgpbMzVDaCAw
ODYwICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQg
RGV2aWNlXQpbMzVEaCAwODYxICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBB
ClszNUVoIDA4NjIgICAyXSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMApbMzYw
aCAwODY0ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwClszNjFoIDA4NjUg
ICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKClszNjJoIDA4NjYgICAyXSAg
ICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDAKClszNjRoIDA4NjggICAyXSAgICAg
ICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDIKCgpbMzY2aCAwODcwICAgMV0gICAgICAg
ICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbMzY3aCAw
ODcxICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBBClszNjhoIDA4NzIgICAy
XSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMApbMzZBaCAwODc0ICAgMV0gICAg
ICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwClszNkJoIDA4NzUgICAxXSAgICAgICAgICAg
ICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKClszNkNoIDA4NzYgICAyXSAgICAgICAgICAgICAgICAg
ICAgIFBDSSBQYXRoIDogMDIsMDAKClszNkVoIDA4NzggICAyXSAgICAgICAgICAgICAgICAgICAg
IFBDSSBQYXRoIDogMDAsMDMKCgpbMzcwaCAwODgwICAgMV0gICAgICAgICAgICBEZXZpY2UgU2Nv
cGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbMzcxaCAwODgxICAgMV0gICAgICAg
ICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBFClszNzJoIDA4ODIgICAyXSAgICAgICAgICAgICAg
ICAgICAgIFJlc2VydmVkIDogMDAwMApbMzc0aCAwODg0ICAgMV0gICAgICAgICAgICAgICBFbnVt
ZXJhdGlvbiBJRCA6IDAwClszNzVoIDA4ODUgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVt
YmVyIDogMDAKClszNzZoIDA4ODYgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDog
MDMsMDAKClszNzhoIDA4ODggICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAs
MDAKClszN0FoIDA4OTAgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDAK
ClszN0NoIDA4OTIgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDAKCgpb
MzdFaCAwODk0ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5k
cG9pbnQgRGV2aWNlXQpbMzdGaCAwODk1ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0
aCA6IDBFClszODBoIDA4OTYgICAyXSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAw
MApbMzgyaCAwODk4ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwClszODNo
IDA4OTkgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKClszODRoIDA5MDAg
ICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDMsMDAKClszODZoIDA5MDIgICAy
XSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDAKClszODhoIDA5MDQgICAyXSAg
ICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDAKClszOEFoIDA5MDYgICAyXSAgICAg
ICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDEKCgpbMzhDaCAwOTA4ICAgMV0gICAgICAg
ICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbMzhEaCAw
OTA5ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBFClszOEVoIDA5MTAgICAy
XSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMApbMzkwaCAwOTEyICAgMV0gICAg
ICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwClszOTFoIDA5MTMgICAxXSAgICAgICAgICAg
ICAgIFBDSSBCdXMgTnVtYmVyIDogMDAKClszOTJoIDA5MTQgICAyXSAgICAgICAgICAgICAgICAg
ICAgIFBDSSBQYXRoIDogMDMsMDAKClszOTRoIDA5MTYgICAyXSAgICAgICAgICAgICAgICAgICAg
IFBDSSBQYXRoIDogMDAsMDAKClszOTZoIDA5MTggICAyXSAgICAgICAgICAgICAgICAgICAgIFBD
SSBQYXRoIDogMDQsMDAKClszOThoIDA5MjAgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQ
YXRoIDogMDAsMDAKCgpbMzlBaCAwOTIyICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlw
ZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbMzlCaCAwOTIzICAgMV0gICAgICAgICAgICAg
ICAgIEVudHJ5IExlbmd0aCA6IDBFClszOUNoIDA5MjQgICAyXSAgICAgICAgICAgICAgICAgICAg
IFJlc2VydmVkIDogMDAwMApbMzlFaCAwOTI2ICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlv
biBJRCA6IDAwClszOUZoIDA5MjcgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDog
MDAKClszQTBoIDA5MjggICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDMsMDAK
ClszQTJoIDA5MzAgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDAKClsz
QTRoIDA5MzIgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDQsMDAKClszQTZo
IDA5MzQgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDEKCgpbM0E4aCAw
OTM2ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQg
RGV2aWNlXQpbM0E5aCAwOTM3ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBB
ClszQUFoIDA5MzggICAyXSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMApbM0FD
aCAwOTQwICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwClszQURoIDA5NDEg
ICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMjAKClszQUVoIDA5NDIgICAyXSAg
ICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDIKClszQjBoIDA5NDQgICAyXSAgICAg
ICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDAKCgpbM0IyaCAwOTQ2ICAgMV0gICAgICAg
ICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbM0IzaCAw
OTQ3ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBBClszQjRoIDA5NDggICAy
XSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAwMApbM0I2aCAwOTUwICAgMV0gICAg
ICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAwClszQjdoIDA5NTEgICAxXSAgICAgICAgICAg
ICAgIFBDSSBCdXMgTnVtYmVyIDogMjAKClszQjhoIDA5NTIgICAyXSAgICAgICAgICAgICAgICAg
ICAgIFBDSSBQYXRoIDogMDIsMDIKClszQkFoIDA5NTQgICAyXSAgICAgICAgICAgICAgICAgICAg
IFBDSSBQYXRoIDogMDAsMDEKCgpbM0JDaCAwOTU2ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2Nv
cGUgVHlwZSA6IDAxIFtQQ0kgRW5kcG9pbnQgRGV2aWNlXQpbM0JEaCAwOTU3ICAgMV0gICAgICAg
ICAgICAgICAgIEVudHJ5IExlbmd0aCA6IDBBClszQkVoIDA5NTggICAyXSAgICAgICAgICAgICAg
ICAgICAgIFJlc2VydmVkIDogMDAwMApbM0MwaCAwOTYwICAgMV0gICAgICAgICAgICAgICBFbnVt
ZXJhdGlvbiBJRCA6IDAwClszQzFoIDA5NjEgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVt
YmVyIDogMjAKClszQzJoIDA5NjIgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDog
MDIsMDIKClszQzRoIDA5NjQgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAs
MDIKCgpbM0M2aCAwOTY2ICAgMV0gICAgICAgICAgICBEZXZpY2UgU2NvcGUgVHlwZSA6IDAxIFtQ
Q0kgRW5kcG9pbnQgRGV2aWNlXQpbM0M3aCAwOTY3ICAgMV0gICAgICAgICAgICAgICAgIEVudHJ5
IExlbmd0aCA6IDBBClszQzhoIDA5NjggICAyXSAgICAgICAgICAgICAgICAgICAgIFJlc2VydmVk
IDogMDAwMApbM0NBaCAwOTcwICAgMV0gICAgICAgICAgICAgICBFbnVtZXJhdGlvbiBJRCA6IDAw
ClszQ0JoIDA5NzEgICAxXSAgICAgICAgICAgICAgIFBDSSBCdXMgTnVtYmVyIDogMjAKClszQ0No
IDA5NzIgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDIsMDIKClszQ0VoIDA5
NzQgICAyXSAgICAgICAgICAgICAgICAgICAgIFBDSSBQYXRoIDogMDAsMDMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdApp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
