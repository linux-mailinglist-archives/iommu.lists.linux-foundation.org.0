Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB7A3A2FD8
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 17:52:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A224B4061F;
	Thu, 10 Jun 2021 15:52:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKBOeSYYaBPZ; Thu, 10 Jun 2021 15:52:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 353FB40619;
	Thu, 10 Jun 2021 15:52:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04E5DC000B;
	Thu, 10 Jun 2021 15:52:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADFC6C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 15:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 8E6B940619
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 15:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id e-y5-iMK-49Y for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 15:52:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id C0386405B1
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 15:51:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623340330; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dM+o12MWIVg7M6B6LIPij+pSLwDnUl7N8TYQnX9w0VY=;
 b=NLw7h/5z0TfkbbtXZ9R4RGzv+gS4Nd2nonmoLZpfXbkApI8JKMX8hSDkwhSciWZzDVzZbUa1
 iaWcP1e4d/f1STzaDXlmQ3T6cSUIIOho3NfWdjCujA0LuDTLuGHpBL3Z9ZW47aT66lhn/4ut
 7MqP/oVLQYe4UcqMk/C8TGYdJQ0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60c234ebe27c0cc77f55375e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Jun 2021 15:51:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3F79AC4338A; Thu, 10 Jun 2021 15:51:06 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F510C433D3;
 Thu, 10 Jun 2021 15:51:03 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 10 Jun 2021 21:21:03 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <61c69d23-324a-85d7-2458-dfff8df9280b@arm.com>
References: <20210609145315.25750-1-saiprakash.ranjan@codeaurora.org>
 <dbcd394a-4d85-316c-5dd0-033546a66132@arm.com>
 <c600e9b2534d54082a5272b508a7985f@codeaurora.org>
 <35bfd245-45e2-8083-b620-330d6dbd7bd7@arm.com>
 <12067ffb8243b220cf03e83aaac3e823@codeaurora.org>
 <266f190e-99ae-9175-cf13-7a77730af389@arm.com>
 <dfdabcdec99a4c6e3bf2b3c5eebe067f@codeaurora.org>
 <61c69d23-324a-85d7-2458-dfff8df9280b@arm.com>
Message-ID: <3cd4db1104ae673fc58340bc6e9b2a52@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Thierry Reding <treding@nvidia.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

SGkgUm9iaW4sCgpPbiAyMDIxLTA2LTEwIDIwOjU5LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gT24g
MjAyMS0wNi0xMCAxMjo1NCwgU2FpIFByYWthc2ggUmFuamFuIHdyb3RlOgo+PiBIaSBSb2JpbiwK
Pj4gCj4+IE9uIDIwMjEtMDYtMTAgMTc6MDMsIFJvYmluIE11cnBoeSB3cm90ZToKPj4+IE9uIDIw
MjEtMDYtMTAgMTA6MzYsIFNhaSBQcmFrYXNoIFJhbmphbiB3cm90ZToKPj4+PiBIaSBSb2JpbiwK
Pj4+PiAKPj4+PiBPbiAyMDIxLTA2LTEwIDE0OjM4LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+Pj4+
IE9uIDIwMjEtMDYtMTAgMDY6MjQsIFNhaSBQcmFrYXNoIFJhbmphbiB3cm90ZToKPj4+Pj4+IEhp
IFJvYmluLAo+Pj4+Pj4gCj4+Pj4+PiBPbiAyMDIxLTA2LTEwIDAwOjE0LCBSb2JpbiBNdXJwaHkg
d3JvdGU6Cj4+Pj4+Pj4gT24gMjAyMS0wNi0wOSAxNTo1MywgU2FpIFByYWthc2ggUmFuamFuIHdy
b3RlOgo+Pj4+Pj4+PiBDdXJyZW50bHkgZm9yIGlvbW11X3VubWFwKCkgb2YgbGFyZ2Ugc2NhdHRl
ci1nYXRoZXIgbGlzdCB3aXRoIAo+Pj4+Pj4+PiBwYWdlIHNpemUKPj4+Pj4+Pj4gZWxlbWVudHMs
IHRoZSBtYWpvcml0eSBvZiB0aW1lIGlzIHNwZW50IGluIGZsdXNoaW5nIG9mIHBhcnRpYWwgCj4+
Pj4+Pj4+IHdhbGtzIGluCj4+Pj4+Pj4+IF9fYXJtX2xwYWVfdW5tYXAoKSB3aGljaCBpcyBhIFZB
IGJhc2VkIFRMQiBpbnZhbGlkYXRpb24gKFRMQklWQSAKPj4+Pj4+Pj4gZm9yCj4+Pj4+Pj4+IGFy
bS1zbW11KS4KPj4+Pj4+Pj4gCj4+Pj4+Pj4+IEZvciBleGFtcGxlOiB0byB1bm1hcCBhIDMyTUIg
c2NhdHRlci1nYXRoZXIgbGlzdCB3aXRoIHBhZ2Ugc2l6ZSAKPj4+Pj4+Pj4gZWxlbWVudHMKPj4+
Pj4+Pj4gKDgxOTIgZW50cmllcyksIHRoZXJlIGFyZSAxNi0+Mk1CIGJ1ZmZlciB1bm1hcHMgYmFz
ZWQgb24gdGhlIAo+Pj4+Pj4+PiBwZ3NpemUgKDJNQgo+Pj4+Pj4+PiBmb3IgNEsgZ3JhbnVsZSkg
YW5kIGVhY2ggb2YgMk1CIHdpbGwgZnVydGhlciByZXN1bHQgaW4gNTEyIAo+Pj4+Pj4+PiBUTEJJ
VkFzICgyTUIvNEspCj4+Pj4+Pj4+IHJlc3VsdGluZyBpbiBhIHRvdGFsIG9mIDgxOTIgVExCSVZB
cyAoNTEyKjE2KSBmb3IgMTYtPjJNQiAKPj4+Pj4+Pj4gY2F1c2luZyBhIGh1Z2UKPj4+Pj4+Pj4g
b3ZlcmhlYWQuCj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBTbyBpbnN0ZWFkIHVzZSBpb19wZ3RhYmxlX3Rs
Yl9mbHVzaF9hbGwoKSB0byBpbnZhbGlkYXRlIHRoZSAKPj4+Pj4+Pj4gZW50aXJlIGNvbnRleHQK
Pj4+Pj4+Pj4gaWYgc2l6ZSAocGdzaXplKSBpcyBncmVhdGVyIHRoYW4gdGhlIGdyYW51bGUgc2l6
ZSAoNEssIDE2SywgCj4+Pj4+Pj4+IDY0SykuIEZvciB0aGlzCj4+Pj4+Pj4+IGV4YW1wbGUgb2Yg
MzJNQiBzY2F0dGVyLWdhdGhlciBsaXN0IHVubWFwLCB0aGlzIHJlc3VsdHMgaW4ganVzdCAKPj4+
Pj4+Pj4gMTYgQVNJRAo+Pj4+Pj4+PiBiYXNlZCBUTEIgaW52YWxpZGF0aW9ucyBvciB0bGJfZmx1
c2hfYWxsKCkgY2FsbGJhY2sgKFRMQklBU0lEIGluIAo+Pj4+Pj4+PiBjYXNlIG9mCj4+Pj4+Pj4+
IGFybS1zbW11KSBhcyBvcHBvc2VkIHRvIDgxOTIgVExCSVZBcyB0aGVyZWJ5IGluY3JlYXNpbmcg
dGhlIAo+Pj4+Pj4+PiBwZXJmb3JtYW5jZSBvZgo+Pj4+Pj4+PiB1bm1hcHMgZHJhc3RpY2FsbHku
Cj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBDb25kaXRpb24gKHNpemUgPiBncmFudWxlIHNpemUpIGlzIGNo
b3NlbiBmb3IgCj4+Pj4+Pj4+IGlvX3BndGFibGVfdGxiX2ZsdXNoX2FsbCgpCj4+Pj4+Pj4+IGJl
Y2F1c2UgZm9yIGFueSBncmFudWxlIHdpdGggc3VwcG9ydGVkIHBnc2l6ZXMsIHdlIHdpbGwgaGF2
ZSBhdCAKPj4+Pj4+Pj4gbGVhc3QgNTEyCj4+Pj4+Pj4+IFRMQiBpbnZhbGlkYXRpb25zIGZvciB3
aGljaCB0bGJfZmx1c2hfYWxsKCkgaXMgYWxyZWFkeSAKPj4+Pj4+Pj4gcmVjb21tZW5kZWQuIEZv
cgo+Pj4+Pj4+PiBleGFtcGxlLCB0YWtlIDRLIGdyYW51bGUgd2l0aCAyTUIgcGdzaXplLCB0aGlz
IHdpbGwgcmVzdWx0IGluIAo+Pj4+Pj4+PiA1MTIgVExCSVZBCj4+Pj4+Pj4+IGluIHBhcnRpYWwg
d2FsayBmbHVzaC4KPj4+Pj4+Pj4gCj4+Pj4+Pj4+IFRlc3Qgb24gUVRJIFNNODE1MCBTb0MgZm9y
IDEwIGl0ZXJhdGlvbnMgb2YgCj4+Pj4+Pj4+IGlvbW11X3ttYXBfc2d9L3VubWFwOgo+Pj4+Pj4+
PiAoYXZlcmFnZSBvdmVyIDEwIGl0ZXJhdGlvbnMpCj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBCZWZvcmUg
dGhpcyBvcHRpbWl6YXRpb246Cj4+Pj4+Pj4+IAo+Pj4+Pj4+PiDCoMKgwqDCoCBzaXplwqDCoMKg
wqDCoMKgwqAgaW9tbXVfbWFwX3NnwqDCoMKgwqDCoCBpb21tdV91bm1hcAo+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqAgNEvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDIuMDY3IHVzwqDCoMKgwqDCoMKgwqDC
oCAxLjg1NCB1cwo+Pj4+Pj4+PiDCoMKgwqDCoMKgIDY0S8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
OS41OTggdXPCoMKgwqDCoMKgwqDCoMKgIDguODAyIHVzCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCAx
TcKgwqDCoMKgwqDCoMKgwqDCoCAxNDguODkwIHVzwqDCoMKgwqDCoMKgIDEzMC43MTggdXMKPj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgIDJNwqDCoMKgwqDCoMKgwqDCoMKgIDMwNS44NjQgdXPCoMKgwqDC
oMKgwqDCoCA2Ny4yOTEgdXMKPj4+Pj4+Pj4gwqDCoMKgwqDCoCAxMk3CoMKgwqDCoMKgwqDCoMKg
IDE3OTMuNjA0IHVzwqDCoMKgwqDCoMKgIDM5MC44MzggdXMKPj4+Pj4+Pj4gwqDCoMKgwqDCoCAx
Nk3CoMKgwqDCoMKgwqDCoMKgIDIzODYuODQ4IHVzwqDCoMKgwqDCoMKgIDUxOC4xODcgdXMKPj4+
Pj4+Pj4gwqDCoMKgwqDCoCAyNE3CoMKgwqDCoMKgwqDCoMKgIDM1NjMuMjk2IHVzwqDCoMKgwqDC
oMKgIDc3NS45ODkgdXMKPj4+Pj4+Pj4gwqDCoMKgwqDCoCAzMk3CoMKgwqDCoMKgwqDCoMKgIDQ3
NDcuMTcxIHVzwqDCoMKgwqDCoCAxMDMzLjM2NCB1cwo+Pj4+Pj4+PiAKPj4+Pj4+Pj4gQWZ0ZXIg
dGhpcyBvcHRpbWl6YXRpb246Cj4+Pj4+Pj4+IAo+Pj4+Pj4+PiDCoMKgwqDCoCBzaXplwqDCoMKg
wqDCoMKgwqAgaW9tbXVfbWFwX3NnwqDCoMKgwqDCoCBpb21tdV91bm1hcAo+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqAgNEvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEuNzIzIHVzwqDCoMKgwqDCoMKgwqDC
oCAxLjc2NSB1cwo+Pj4+Pj4+PiDCoMKgwqDCoMKgIDY0S8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
OS44ODAgdXPCoMKgwqDCoMKgwqDCoMKgIDguODY5IHVzCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCAx
TcKgwqDCoMKgwqDCoMKgwqDCoCAxNTUuMzY0IHVzwqDCoMKgwqDCoMKgIDEzNS4yMjMgdXMKPj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgIDJNwqDCoMKgwqDCoMKgwqDCoMKgIDMwMy45MDYgdXPCoMKgwqDC
oMKgwqDCoMKgIDUuMzg1IHVzCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgMTJNwqDCoMKgwqDCoMKgwqDC
oCAxNzg2LjU1NyB1c8KgwqDCoMKgwqDCoMKgIDIxLjI1MCB1cwo+Pj4+Pj4+PiDCoMKgwqDCoMKg
IDE2TcKgwqDCoMKgwqDCoMKgwqAgMjM5MS44OTAgdXPCoMKgwqDCoMKgwqDCoCAyNy40MzcgdXMK
Pj4+Pj4+Pj4gwqDCoMKgwqDCoCAyNE3CoMKgwqDCoMKgwqDCoMKgIDM1NzAuODk1IHVzwqDCoMKg
wqDCoMKgwqAgMzkuOTM3IHVzCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgMzJNwqDCoMKgwqDCoMKgwqDC
oCA0NzU1LjIzNCB1c8KgwqDCoMKgwqDCoMKgIDUxLjc5NyB1cwo+Pj4+Pj4+PiAKPj4+Pj4+Pj4g
VGhpcyBpcyBmdXJ0aGVyIHJlZHVjZWQgb25jZSB0aGUgbWFwL3VubWFwX3BhZ2VzKCkgc3VwcG9y
dCBnZXRzIAo+Pj4+Pj4+PiBpbiB3aGljaAo+Pj4+Pj4+PiB3aWxsIHJlc3VsdCBpbiBqdXN0IDEg
dGxiX2ZsdXNoX2FsbCgpIGFzIG9wcG9zZWQgdG8gMTYgCj4+Pj4+Pj4+IHRsYl9mbHVzaF9hbGwo
KS4KPj4+Pj4+Pj4gCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNhaSBQcmFrYXNoIFJhbmphbiAK
Pj4+Pj4+Pj4gPHNhaXByYWthc2gucmFuamFuQGNvZGVhdXJvcmEub3JnPgo+Pj4+Pj4+PiAtLS0K
Pj4+Pj4+Pj4gwqAgZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jIHwgNyArKysrKy0tCj4+
Pj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pby1wZ3RhYmxl
LWFybS5jIAo+Pj4+Pj4+PiBiL2RyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1hcm0uYwo+Pj4+Pj4+
PiBpbmRleCA4N2RlZjU4ZTc5YjUuLmMzY2I5YWRkMzE3OSAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEv
ZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5jCj4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvaW9t
bXUvaW8tcGd0YWJsZS1hcm0uYwo+Pj4+Pj4+PiBAQCAtNTg5LDggKzU4OSwxMSBAQCBzdGF0aWMg
c2l6ZV90IF9fYXJtX2xwYWVfdW5tYXAoc3RydWN0IAo+Pj4+Pj4+PiBhcm1fbHBhZV9pb19wZ3Rh
YmxlICpkYXRhLAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaW9wdGVfbGVh
ZihwdGUsIGx2bCwgaW9wLT5mbXQpKSB7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC8qIEFsc28gZmx1c2ggYW55IHBhcnRpYWwgd2Fsa3MgKi8KPj4+Pj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaW9fcGd0YWJsZV90bGJfZmx1c2hfd2Fsayhpb3AsIGlvdmEsIHNpemUs
Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBBUk1fTFBBRV9HUkFOVUxFKGRhdGEpKTsKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKHNpemUgPiBBUk1fTFBBRV9HUkFOVUxFKGRhdGEpKQo+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlvX3BndGFibGVfdGxiX2ZsdXNoX2FsbChpb3ApOwo+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4+Pj4gCj4+Pj4+Pj4gRXJt
LCB3aGVuIHdpbGwgdGhlIGFib3ZlIGNvbmRpdGlvbiBldmVyIG5vdCBiZSB0cnVlPyA7KQo+Pj4+
Pj4+IAo+Pj4+Pj4gCj4+Pj4+PiBBaCByaWdodCwgc2lsbHkgbWUgOikKPj4+Pj4+IAo+Pj4+Pj4+
IFRha2luZyBhIHN0ZXAgYmFjaywgdGhvdWdoLCB3aGF0IGFib3V0IHRoZSBpbXBhY3QgdG8gZHJp
dmVycyAKPj4+Pj4+PiBvdGhlcgo+Pj4+Pj4+IHRoYW4gU01NVXYyPwo+Pj4+Pj4gCj4+Pj4+PiBP
dGhlciBkcml2ZXJzIHdvdWxkIGJlIG1zbV9pb21tdS5jLCBxY29tX2lvbW11LmMgd2hpY2ggZG9l
cyB0aGUgCj4+Pj4+PiBzYW1lCj4+Pj4+PiB0aGluZyBhcyBhcm0tc21tdS12MiAocGFnZSBiYXNl
ZCBpbnZhbGlkYXRpb25zKSwgdGhlbiB0aGVyZSBpcyAKPj4+Pj4+IGlwbW11LXZtc2EuYwo+Pj4+
Pj4gd2hpY2ggZG9lcyB0bGJfZmx1c2hfYWxsKCkgZm9yIGZsdXNoIHdhbGsuCj4+Pj4+PiAKPj4+
Pj4+PiBJbiBwYXJ0aWN1bGFyIEknbSB0aGlua2luZyBvZiBTTU1VdjMuMiB3aGVyZSB0aGUgd2hv
bGUKPj4+Pj4+PiByYW5nZSBjYW4gYmUgaW52YWxpZGF0ZWQgYnkgVkEgaW4gYSBzaW5nbGUgY29t
bWFuZCBhbnl3YXksIHNvIHRoZQo+Pj4+Pj4+IGFkZGl0aW9uYWwgcGVuYWx0aWVzIG9mIFRMQklB
TEwgYXJlIHVuZGVzaXJhYmxlLgo+Pj4+Pj4+IAo+Pj4+Pj4gCj4+Pj4+PiBSaWdodCwgc28gSSBh
bSB0aGlua2luZyB3ZSBjYW4gaGF2ZSBhIG5ldyBnZW5lcmljIHF1aXJrIAo+Pj4+Pj4gSU9fUEdU
QUJMRV9RVUlSS19SQU5HRV9JTlYKPj4+Pj4+IHRvIGNob29zZSBiZXR3ZWVuIHJhbmdlIGJhc2Vk
IGludmFsaWRhdGlvbnModGxiX2ZsdXNoX3dhbGspIGFuZCAKPj4+Pj4+IHRsYl9mbHVzaF9hbGwo
KS4KPj4+Pj4+IEluIHRoaXMgY2FzZSBvZiBhcm0tc21tdS12My4yLCB3ZSBjYW4gdGllIHVwIAo+
Pj4+Pj4gQVJNX1NNTVVfRkVBVF9SQU5HRV9JTlYgd2l0aCB0aGlzIHF1aXJrCj4+Pj4+PiBhbmQg
aGF2ZSBzb21ldGhpbmcgbGlrZSBiZWxvdywgdGhvdWdodHM/Cj4+Pj4+PiAKPj4+Pj4+IGlmIChp
b3AtPmNmZy5xdWlya3MgJiBJT19QR1RBQkxFX1FVSVJLX1JBTkdFX0lOVikKPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqAgaW9fcGd0YWJsZV90bGJfZmx1c2hfd2Fsayhpb3AsIGlvdmEsIHNpemUsCj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBBUk1fTFBBRV9HUkFOVUxFKGRhdGEpKTsKPj4+Pj4+IGVsc2UKPj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaW9fcGd0YWJsZV90bGJfZmx1c2hfYWxsKGlvcCk7Cj4+Pj4+
IAo+Pj4+PiBUaGUgZGVzaWduIGhlcmUgaGFzIGFsd2F5cyBiZWVuIHRoYXQgaW8tcGd0YWJsZSBz
YXlzICp3aGF0KiBuZWVkcwo+Pj4+PiBpbnZhbGlkYXRpbmcsIGFuZCB3ZSBsZWZ0IGl0IHVwIHRv
IHRoZSBkcml2ZXJzIHRvIGRlY2lkZSBleGFjdGx5Cj4+Pj4+ICpob3cqLiBFdmVuIHRob3VnaCB0
aGluZ3MgaGF2ZSBldm9sdmVkIGEgYml0IEkgZG9uJ3QgdGhpbmsgdGhhdCBoYXMKPj4+Pj4gZnVu
ZGFtZW50YWxseSBjaGFuZ2VkIC0gdGxiX2ZsdXNoX3dhbGsgaXMgbm93IG9ubHkgdXNlZCBpbiB0
aGlzIG9uZQo+Pj4+PiBwbGFjZSAodGVjaG5pY2FsbHkgSSBzdXBwb3NlIGl0IGNvdWxkIGJlIHJl
bmFtZWQgdGxiX2ZsdXNoX3RhYmxlIAo+Pj4+PiBidXQKPj4+Pj4gaXQncyBub3Qgd29ydGggdGhl
IGNodXJuKSwgc28gZHJpdmVycyBjYW4gaW1wbGVtZW50IHRoZWlyIG93bgo+Pj4+PiBwcmVmZXJy
ZWQgdGFibGUtaW52YWxpZGF0aW5nIGJlaGF2aW91ciBldmVuIG1vcmUgZWFzaWx5IHRoYW4gCj4+
Pj4+IGNob29zaW5nCj4+Pj4+IHdoZXRoZXIgdG8gYm91bmNlIGEgcXVpcmsgdGhyb3VnaCB0aGUg
Y29tbW9uIGNvZGUgb3Igbm90LiBDb25zaWRlcgo+Pj4+PiB3aGF0IHlvdSd2ZSBhbHJlYWR5IHNl
ZW4gZm9yIHRoZSBSZW5lc2FzIElQTU1VLCBvciBTTU1VdjEgc3RhZ2UgCj4+Pj4+IDIuLi4KPj4+
Pj4gCj4+Pj4gCj4+Pj4gVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24sIG1ha2VzIHNlbnNlLiBJ
ZiBJIGFtIG5vdCBtaXN0YWtlbiwgSSBzZWUgCj4+Pj4gdGhhdAo+Pj4+IHlvdSBhcmUgc3VnZ2Vz
dGluZyB0byBtb3ZlIHRoaXMgbG9naWMgYmFzZWQgb24gc2l6ZSBhbmQgZ3JhbnVsZS1zaXplIAo+
Pj4+IHRvCj4+Pj4gYXJtLXNtbXUtdjIgZHJpdmVyIGFuZCBvbmUgbW9yZSB0aGluZyBiZWxvdy4u
Cj4+PiAKPj4+IFNpbXBsZXIgdGhhbiB0aGF0IC0gZm9sbG93aW5nIG9uIGZyb20gbXkgb3JpZ2lu
YWwgY29tbWVudCBhYm92ZSwKPj4+IHRsYl9mbHVzaF93YWxrIGFscmVhZHkga25vd3MgaXQncyBp
bnZhbGlkYXRpbmcgYXQgbGVhc3Qgb25lIGZ1bGwgCj4+PiBsZXZlbAo+Pj4gb2YgdGFibGUgc28g
dGhlcmUncyBub3RoaW5nIGl0IGV2ZW4gbmVlZHMgdG8gY2hlY2suIEFkZGluZyBhCj4+PiBzaXpl
LWJhc2VkIGhldXJpc3RpYyB0byBhcm1fc21tdV9pbnZfcmFuZ2VfKiBmb3IgbGVhZiBpbnZhbGlk
YXRpb25zCj4+PiB3b3VsZCBiZSBhIHNlcGFyYXRlIGNvbmNlcm4gKG5vdGUgdGhhdCBjaGFuZ2lu
ZyB0aGUgbm9uLWxlYWYgCj4+PiBiZWhhdmlvdXIKPj4+IG1pZ2h0IGFsbG93IGNsZWFuaW5nIHVw
IHRoZSAicmVnIiBpbmRpcmVjdGlvbiB0aGVyZSB0b28pLgo+PiAKPj4gUmlnaHQsIHNvcnJ5IEkg
ZGlkbid0IG1lYW4gdG8gbWVudGlvbiB0aGUgc2l6ZSBjaGVjayBhcyBpdCB3YXMgb2J2aW91cwo+
PiBmcm9tIHlvdXIgZmlyc3QgcmVwbHksIGJ1dCByYXRoZXIganVzdCBjYWxsaW5nIGltcGwtPnRs
Yl9pbnYoKSBpbgo+PiBhcm1fc21tdV90bGJfaW52X3dhbGtfczEoKS4KPj4gCj4+PiAKPj4+Pj4g
SSdtIGluc3RpbmN0aXZlbHkgYSBsaXR0bGUgdHdpdGNoeSBhYm91dCBtYWtpbmcgdGhpcyBhIGJs
YW5rZXQKPj4+Pj4gb3B0aW1pc2F0aW9uIGZvciBTTU1VdjIgc2luY2UgSSBzdGlsbCByZW1lbWJl
ciB0aGUgcGFsYXZlciB3aXRoIG91cgo+Pj4+PiBkaXNwbGF5IGFuZCBNTVUtNTAwIGludGVncmF0
aW9ucywgd2hlcmUgaXQgaGFkIHRvIGltcGxlbWVudCB0aGUgCj4+Pj4+IGRvZGd5Cj4+Pj4+ICJw
cmVmZXRjaCIgcmVnaXN0ZXIgdG8gdHJpZ2dlciB0cmFuc2xhdGlvbnMgYmVmb3JlIHNjYW5uaW5n
IG91dCBhCj4+Pj4+IGZyYW1lIHNpbmNlIGl0IGNvdWxkbid0IGV2ZXIgYWZmb3JkIGEgVExCIG1p
c3MsIHRodXMgVExCSUFMTCB3aGVuCj4+Pj4+IGZyZWVpbmcgYW4gb2xkIGJ1ZmZlciB3b3VsZCBi
ZSBhIGRhbmdlcm91cyBoYW1tZXIgdG8gc3dpbmcuIEhvd2V2ZXIKPj4+Pj4gSUlSQyBpdCBhbHNv
IGhhZCB0byBlbnN1cmUgZXZlcnl0aGluZyB3YXMgbWFwcGVkIGFzIDJNQiBibG9ja3MgdG8KPj4+
Pj4gZ3VhcmFudGVlIGZpdHRpbmcgZXZlcnl0aGluZyBpbiB0aGUgVExCcyBpbiB0aGUgZmlyc3Qg
cGxhY2UsIHNvIEkKPj4+Pj4gZ3Vlc3MgaXQgd291bGQgc3RpbGwgd29yayBvdXQgT0sgZHVlIHRv
IG5ldmVyIHJlYWxpc3RpY2FsbHkgCj4+Pj4+IHVubWFwcGluZwo+Pj4+PiBhIHdob2xlIHRhYmxl
IGF0IG9uY2UgYW55d2F5Lgo+Pj4+PiAKPj4+PiAKPj4+PiBZb3UgYXJlIGFsc28gaGludGluZyB0
byBub3QgZG8gdGhpcyBmb3IgYWxsIFNNTVV2MiBpbXBsZW1lbnRhdGlvbnMgCj4+Pj4gYW5kIG1h
a2UKPj4+PiBpdCBRQ09NIHNwZWNpZmljPwo+Pj4gCj4+PiBObywgSSdtIHJlYWxseSBqdXN0IHdh
cnkgdGhhdCB0aGUgcGVyZm9ybWFuY2UgaW1wbGljYXRpb24gaXMgbW9yZQo+Pj4gY29tcGxleCB0
aGFuIGEgc2ltcGxlIHVubWFwIGxhdGVuY3kgYmVuZWZpdCwgcG9zc2libHkgZXZlbiBmb3IgUUNP
TS4KPj4+IENvbnNpZGVyIHRoZSBhY2Nlc3MgbGF0ZW5jeSwgcG93ZXIgYW5kIG1lbW9yeSBiYW5k
d2lkdGggaGl0IGZyb20gYWxsCj4+PiB0aGUgYWRkaXRpb25hbCBwYWdldGFibGUgd2Fsa3MgaW5j
dXJyZWQgYnkgb3RoZXIgb25nb2luZyB0cmFmZmljCj4+PiBmaWdodGluZyBhZ2FpbnN0IHRob3Nl
IDE2IHN1Y2Nlc3NpdmUgVExCSUFTSURzLiBXaGV0aGVyIGl0J3MgYW4KPj4+IG92ZXJhbGwgd2lu
IHJlYWxseSBkZXBlbmRzIG9uIHRoZSBzcGVjaWZpYyB3b3JrbG9hZCBhbmQgc3lzdGVtCj4+PiBj
b25kaXRpb25zIGFzIG11Y2ggYXMgdGhlIFNNTVUgaW1wbGVtZW50YXRpb24uCj4+IAo+PiBObywg
dGhlIHVubWFwIGxhdGVuY3kgaXMgbm90IGp1c3QgaW4gc29tZSB0ZXN0IGNhc2Ugd3JpdHRlbiwg
dGhlIGlzc3VlCj4+IGlzIHZlcnkgcmVhbCBhbmQgd2UgaGF2ZSB3b3JrbG9hZHMgd2hlcmUgY2Ft
ZXJhIGlzIHJlcG9ydGluZyBmcmFtZSAKPj4gZHJvcHMKPj4gYmVjYXVzZSBvZiB0aGlzIHVubWFw
IGxhdGVuY3kgaW4gdGhlIG9yZGVyIG9mIDEwMHMgb2YgbWlsbGlzZWNvbmRzLgo+PiBBbmQgaGFy
ZHdhcmUgdGVhbSByZWNvbW1lbmRzIHVzaW5nIEFTSUQgYmFzZWQgaW52YWxpZGF0aW9ucyBmb3Ig
Cj4+IGFueXRoaW5nCj4+IGxhcmdlciB0aGFuIDEyOCBUTEIgZW50cmllcy4gU28geWVzLCB3ZSBo
YXZlIHRha2VuIG5vdGUgb2YgaW1wYWN0cyAKPj4gaGVyZQo+PiBiZWZvcmUgZ29pbmcgdGhpcyB3
YXkgYW5kIGhlbmNlIGZlZWwgbW9yZSBpbmNsaW5lZCB0byBtYWtlIHRoaXMgcWNvbQo+PiBzcGVj
aWZpYyBpZiByZXF1aXJlZC4KPiAKPiBPSywgdGhhdCdzIGdvb2QgdG8ga25vdy4gSSBuZXZlciBz
dWdnZXN0ZWQgdGhhdCBDUFUgdW5tYXAgbGF0ZW5jeQo+IHdhc24ndCBhIHZhbGlkIGNvbmNlcm4g
aW4gaXRzZWxmIC0gb2J2aW91c2x5IHNwZW5kaW5nIG1pbGxpb25zIG9mCj4gY3ljbGVzIGluLCBz
YXksIGFuIGludGVycnVwdCBoYW5kbGVyIGRvaW5nIHBvaW50bGVzcyBidXN5IHdvcmsgaGFzCj4g
c29tZSBzZXJpb3VzIGRvd25zaWRlcyAtIGp1c3QgdGhhdCBpdCBtaWdodCBub3QgYWx3YXlzIGJl
IHRoZSBtb3N0Cj4gaW1wb3J0YW50IGNvbmNlcm4gZm9yIGV2ZXJ5b25lLCBzbyBJIHdhbnRlZCB0
byBtYWtlIHN1cmUgdGhpcwo+IGRpc2N1c3Npb24gd2FzIGhhZCBpbiB0aGUgb3Blbi4KPiAKClJp
Z2h0LCBteSBtaXN0YWtlIHRoYXQgSSBtaXNzZWQgdG8gbWVudGlvbiB0aGVzZSBkZXRhaWxzIG9m
IHJlYWwgd29ybGQKZGF0YSBpbiBjb21taXQgdGV4dCwgd2lsbCBhZGQgdGhlbSBpbiBuZXh0IHZl
cnNpb24uCgo+IFRCSCBJICphbSogaW5jbGluZWQgdG8gbWFrZSB0aGlzIGEgY29yZSBTTU1VIGRy
aXZlciBjaGFuZ2UgcHJvdmlkZWQKPiBub2JvZHkgcG9wcyB1cCB3aXRoIGEgc3Ryb25nIGNvdW50
ZXItYXJndW1lbnQuCj4gCgpPayB0aGF0J3MgZXZlbiBiZXR0ZXIgaW4gY2FzZSBpdCBoZWxwcyBv
dGhlcnMgYXMgd2VsbC4KCj4+PiBUaGlua2luZyBzb21lIG1vcmUsIEkKPj4+IHdvbmRlciBpZiB0
aGUgVGVncmEgZm9sa3MgbWlnaHQgaGF2ZSBhbiBvcGluaW9uIHRvIGFkZCBoZXJlLCBnaXZlbgo+
Pj4gdGhhdCB0aGVpciBtdWx0aXBsZS1TTU1VIHNvbHV0aW9uIHdhcyBzZWVtaW5nbHkgYWJvdXQg
dHJ5aW5nIHRvIGdldAo+Pj4gZW5vdWdoIFRMQiBhbmQgcGFnZXRhYmxlIHdhbGsgYmFuZHdpZHRo
IGluIHRoZSBmaXJzdCBwbGFjZT8KPj4+IAo+PiAKPj4gU3VyZSBidXQgSSBkbyBub3Qgc2VlIGhv
dyB0aGF0IHdpbGwgaGVscCB3aXRoIHRoZSB1bm1hcCBsYXRlbmN5Pwo+IAo+IEl0IHdvbid0LiBI
b3dldmVyIGl0IGltcGxpZXMgYSB1c2UtY2FzZSB3aGljaCBpcyBhbHJlYWR5IHNlbnNpdGl2ZSB0
bwo+IHRyYW5zbGF0aW9uIGJhbmR3aWR0aCwgYW5kIHRodXMgaXMgc29tZXdoYXQgbW9yZSBsaWtl
bHkgdG8gYmUKPiBzZW5zaXRpdmUgdG8gb3Zlci1pbnZhbGlkYXRpb24uIEJ1dCBldmVuIHRoZW4g
dGhleSBhbHNvIGhhdmUgbW9yZSB0bwo+IGdhaW4gZnJvbSByZWR1Y2luZyB0aGUgbnVtYmVyIG9m
IE1NSU8gd3JpdGVzIHRoYXQgaGF2ZSB0byBiZQo+IGR1cGxpY2F0ZWQgOikKPiAKCkFoIEkgc2Vl
LCBzb3JyeSBJIG1pc3VuZGVyc3Rvb2QuIEl0J3MgZGVmaW5pdGVseSBiZXR0ZXIgaWYgdGhpcyBn
ZXRzCnRlc3RlZCBvbiBvdGhlciBzeXN0ZW1zIGFzIHdlbGwuCgpUaGFua3MsClNhaQoKLS0gClFV
QUxDT01NIElORElBLCBvbiBiZWhhbGYgb2YgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIElu
Yy4gaXMgYSAKbWVtYmVyCm9mIENvZGUgQXVyb3JhIEZvcnVtLCBob3N0ZWQgYnkgVGhlIExpbnV4
IEZvdW5kYXRpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
