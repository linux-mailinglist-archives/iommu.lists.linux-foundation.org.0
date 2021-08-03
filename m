Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E563DEB51
	for <lists.iommu@lfdr.de>; Tue,  3 Aug 2021 12:54:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32EB1401EB;
	Tue,  3 Aug 2021 10:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIahXuZQKu6g; Tue,  3 Aug 2021 10:54:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5648C401E6;
	Tue,  3 Aug 2021 10:54:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C1D1C000E;
	Tue,  3 Aug 2021 10:54:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A449C000E;
 Tue,  3 Aug 2021 10:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBABD81DCA;
 Tue,  3 Aug 2021 10:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUnKzj3FMNbG; Tue,  3 Aug 2021 10:54:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DF2F81D67;
 Tue,  3 Aug 2021 10:54:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 237041396;
 Tue,  3 Aug 2021 03:54:26 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 805143F40C;
 Tue,  3 Aug 2021 03:54:22 -0700 (PDT)
Subject: Re: [PATCH v10 01/17] iova: Export alloc_iova_fast() and
 free_iova_fast()
To: Yongji Xie <xieyongji@bytedance.com>, Jason Wang <jasowang@redhat.com>
References: <20210729073503.187-1-xieyongji@bytedance.com>
 <20210729073503.187-2-xieyongji@bytedance.com>
 <43d88942-1cd3-c840-6fec-4155fd544d80@redhat.com>
 <CACycT3vcpwyA3xjD29f1hGnYALyAd=-XcWp8+wJiwSqpqUu00w@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6e05e25e-e569-402e-d81b-8ac2cff1c0e8@arm.com>
Date: Tue, 3 Aug 2021 11:53:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACycT3vcpwyA3xjD29f1hGnYALyAd=-XcWp8+wJiwSqpqUu00w@mail.gmail.com>
Content-Language: en-GB
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Liu Xiaodong <xiaodong.liu@intel.com>, Joe Perches <joe@perches.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Stefan Hajnoczi <stefanha@redhat.com>,
 songmuchun@bytedance.com, Jens Axboe <axboe@kernel.dk>,
 He Zhe <zhe.he@windriver.com>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>
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

T24gMjAyMS0wOC0wMyAwOTo1NCwgWW9uZ2ppIFhpZSB3cm90ZToKPiBPbiBUdWUsIEF1ZyAzLCAy
MDIxIGF0IDM6NDEgUE0gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+
Cj4+Cj4+IOWcqCAyMDIxLzcvMjkg5LiL5Y2IMzozNCwgWGllIFlvbmdqaSDlhpnpgZM6Cj4+PiBF
eHBvcnQgYWxsb2NfaW92YV9mYXN0KCkgYW5kIGZyZWVfaW92YV9mYXN0KCkgc28gdGhhdAo+Pj4g
c29tZSBtb2R1bGVzIGNhbiB1c2UgaXQgdG8gaW1wcm92ZSBpb3ZhIGFsbG9jYXRpb24gZWZmaWNp
ZW5jeS4KPj4KPj4KPj4gSXQncyBiZXR0ZXIgdG8gZXhwbGFpbiB3aHkgYWxsb2NfaW92YSgpIGlz
IG5vdCBzdWZmaWNpZW50IGhlcmUuCj4+Cj4gCj4gRmluZS4KCldoYXQgSSBmYWlsIHRvIHVuZGVy
c3RhbmQgZnJvbSB0aGUgbGF0ZXIgcGF0Y2hlcyBpcyB3aGF0IHRoZSBJT1ZBIGRvbWFpbiAKYWN0
dWFsbHkgcmVwcmVzZW50cy4gSWYgdGhlICJkZXZpY2UiIGlzIGEgdXNlcnNwYWNlIHByb2Nlc3Mg
dGhlbiAKbG9naWNhbGx5IHRoZSAiSU9WQSIgd291bGQgYmUgdGhlIHVzZXJzcGFjZSBhZGRyZXNz
LCBzbyBwcmVzdW1hYmx5IApzb21ld2hlcmUgeW91J3JlIGhhdmluZyB0byB0cmFuc2xhdGUgYmV0
d2VlbiB0aGlzIGFyYml0cmFyeSBhZGRyZXNzIApzcGFjZSBhbmQgYWN0dWFsIHVzYWJsZSBhZGRy
ZXNzZXMgLSBpZiB5b3UncmUgd29ycmllZCBhYm91dCBlZmZpY2llbmN5IApzdXJlbHkgaXQgd291
bGQgYmUgZXZlbiBiZXR0ZXIgdG8gbm90IGRvIHRoYXQ/CgpQcmVzdW1hYmx5IHVzZXJzcGFjZSBk
b2Vzbid0IGhhdmUgYW55IGNvbmNlcm4gYWJvdXQgYWxpZ25tZW50IGFuZCB0aGUgCnRoaW5ncyB3
ZSBoYXZlIHRvIHdvcnJ5IGFib3V0IGZvciB0aGUgRE1BIEFQSSBpbiBnZW5lcmFsLCBzbyBpdCdz
IHByZXR0eSAKbXVjaCBqdXN0IGFsbG9jYXRpbmcgc2xvdHMgaW4gYSBidWZmZXIsIGFuZCB0aGVy
ZSBhcmUgZmFyIG1vcmUgZWZmZWN0aXZlIAp3YXlzIHRvIGRvIHRoYXQgdGhhbiBhIGZ1bGwtYmxv
d24gYWRkcmVzcyBzcGFjZSBtYW5hZ2VyLiBJZiB5b3UncmUgZ29pbmcgCnRvIHJldXNlIGFueSBp
bmZyYXN0cnVjdHVyZSBJJ2QgaGF2ZSBleHBlY3RlZCBpdCB0byBiZSBTV0lPVExCIHJhdGhlciAK
dGhhbiB0aGUgSU9WQSBhbGxvY2F0b3IuIEJlY2F1c2UsIHkna25vdywgeW91J3JlICpsaXRlcmFs
bHkgaW1wbGVtZW50aW5nIAphIHNvZnR3YXJlIEkvTyBUTEIqIDspCgpSb2Jpbi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0
CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
