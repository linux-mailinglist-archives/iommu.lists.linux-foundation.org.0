Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BD2136A94
	for <lists.iommu@lfdr.de>; Fri, 10 Jan 2020 11:08:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7AA7A2047F;
	Fri, 10 Jan 2020 10:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DPOfP3rBKib; Fri, 10 Jan 2020 10:08:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 647F020477;
	Fri, 10 Jan 2020 10:08:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56ED0C0881;
	Fri, 10 Jan 2020 10:08:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90112C0881
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 10:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7F76E86AEC
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 10:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zs2PHTpLcvb0 for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 10:08:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C1FC986A51
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 10:08:23 +0000 (UTC)
Received: from lhreml701-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 0506D60485352686A595;
 Fri, 10 Jan 2020 10:08:21 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml701-cah.china.huawei.com (10.201.108.42) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 10 Jan 2020 10:08:20 +0000
Received: from localhost (10.202.226.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 10 Jan
 2020 10:08:20 +0000
Date: Fri, 10 Jan 2020 10:08:18 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: zhangfei <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v10 0/4] Add uacce module for Accelerator
Message-ID: <20200110100818.0000151a@Huawei.com>
In-Reply-To: <9b87edca-dd4e-3fe2-5acd-11f7381593ed@linaro.org>
References: <1576465697-27946-1-git-send-email-zhangfei.gao@linaro.org>
 <20200109174952.000051e1@Huawei.com>
 <9b87edca-dd4e-3fe2-5acd-11f7381593ed@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.57]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: jean-philippe <jean-philippe@linaro.org>, Dave Jiang <dave.jiang@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 francois.ozog@linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ilias.apalodimas@linaro.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Jerome
 Glisse <jglisse@redhat.com>, grant.likely@arm.com,
 "haojian . zhuang" <haojian.zhuang@linaro.org>,
 linux-accelerators@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 guodong.xu@linaro.org, kenneth-lee-2012@foxmail.com
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

T24gRnJpLCAxMCBKYW4gMjAyMCAxNTowMzoyNSArMDgwMAp6aGFuZ2ZlaSA8emhhbmdmZWkuZ2Fv
QGxpbmFyby5vcmc+IHdyb3RlOgoKPiBPbiAyMDIwLzEvMTAg5LiK5Y2IMTo0OSwgSm9uYXRoYW4g
Q2FtZXJvbiB3cm90ZToKPiA+IE9uIE1vbiwgMTYgRGVjIDIwMTkgMTE6MDg6MTMgKzA4MDAKPiA+
IFpoYW5nZmVpIEdhbyA8emhhbmdmZWkuZ2FvQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gIAo+ID4+
IFVhY2NlIChVbmlmaWVkL1VzZXItc3BhY2UtYWNjZXNzLWludGVuZGVkIEFjY2VsZXJhdG9yIEZy
YW1ld29yaykgdGFyZ2V0cyB0bwo+ID4+IHByb3ZpZGUgU2hhcmVkIFZpcnR1YWwgQWRkcmVzc2lu
ZyAoU1ZBKSBiZXR3ZWVuIGFjY2VsZXJhdG9ycyBhbmQgcHJvY2Vzc2VzLgo+ID4+IFNvIGFjY2Vs
ZXJhdG9yIGNhbiBhY2Nlc3MgYW55IGRhdGEgc3RydWN0dXJlIG9mIHRoZSBtYWluIGNwdS4KPiA+
PiBUaGlzIGRpZmZlcnMgZnJvbSB0aGUgZGF0YSBzaGFyaW5nIGJldHdlZW4gY3B1IGFuZCBpbyBk
ZXZpY2UsIHdoaWNoIHNoYXJlCj4gPj4gZGF0YSBjb250ZW50IHJhdGhlciB0aGFuIGFkZHJlc3Mu
Cj4gPj4gQmVjYXVzZSBvZiB1bmlmaWVkIGFkZHJlc3MsIGhhcmR3YXJlIGFuZCB1c2VyIHNwYWNl
IG9mIHByb2Nlc3MgY2FuIHNoYXJlCj4gPj4gdGhlIHNhbWUgdmlydHVhbCBhZGRyZXNzIGluIHRo
ZSBjb21tdW5pY2F0aW9uLgo+ID4+Cj4gPj4gVWFjY2UgaXMgaW50ZW5kZWQgdG8gYmUgdXNlZCB3
aXRoIEplYW4gUGhpbGlwcGUgQnJ1Y2tlcidzIFNWQQo+ID4+IHBhdGNoc2V0WzFdLCB3aGljaCBl
bmFibGVzIElPIHNpZGUgcGFnZSBmYXVsdCBhbmQgUEFTSUQgc3VwcG9ydC4KPiA+PiBXZSBoYXZl
IGtlZXAgdmVyaWZ5aW5nIHdpdGggSmVhbidzIHN2YSBwYXRjaHNldCBbMl0KPiA+PiBXZSBhbHNv
IGtlZXAgdmVyaWZ5aW5nIHdpdGggRXJpYydzIFNNTVV2MyBOZXN0ZWQgU3RhZ2UgcGF0Y2hlcyBb
M10gIAo+ID4gSGkgWmhhbmdmZWkgR2FvLAo+ID4KPiA+IEp1c3QgdG8gY2hlY2sgbXkgdW5kZXJz
dGFuZGluZy4uLgo+ID4KPiA+IFRoaXMgcGF0Y2ggc2V0IGlzIG5vdCBkZXBlbmRlbnQgb24gZWl0
aGVyIDIgb3IgMz8KPiA+Cj4gPiBUbyB1c2UgaXQgb24gb3VyIGhhcmR3YXJlLCB3ZSBuZWVkIDIs
IGJ1dCB0aGUgaW50ZXJmYWNlcyB1c2VkIGFyZSBhbHJlYWR5Cj4gPiB1cHN0cmVhbSwgc28gdGhp
cyBjb3VsZCBtb3ZlIGZvcndhcmRzIGluIHBhcmFsbGVsLgo+ID4KPiA+ICAKPiBZZXMsCj4gcGF0
Y2ggMSwgMiBpcyBmb3IgdWFjY2UuCj4gcGF0Y2ggMywgNCBpcyBhbiBleGFtcGxlIHVzaW5nIHVh
Y2NlLCB3aGljaCBoYXBwZW4gdG8gYmUgY3J5cHRvLgpTb3JyeSwgSSB3YXNuJ3QgY2xlYXIgZW5v
dWdoLgoKUXVlc3Rpb24gaXMgd2hldGhlciB3ZSBuZWVkIEplYW4ncyBzdmEgcGF0Y2ggc2V0IFsy
XSB0byBtZXJnZSB0aGlzPwoKPiAKPiBUaGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vaW9tbXU=
