Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3640FEF691
	for <lists.iommu@lfdr.de>; Tue,  5 Nov 2019 08:44:06 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A729DDD8;
	Tue,  5 Nov 2019 07:44:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A8A43AB9
	for <iommu@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 07:44:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EE0AA189
	for <iommu@lists.linux-foundation.org>;
	Tue,  5 Nov 2019 07:43:58 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l24so13430347pgh.10
	for <iommu@lists.linux-foundation.org>;
	Mon, 04 Nov 2019 23:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=8/Gn0utFRmAPxSXpFGHDgnfqJKxWyml3l8N7RpHi2XQ=;
	b=dFa9bQYkEdjVt76sMEZWdPwED2EseasI5aOJq3fI31/rH/N9CKPUmcaNjTVV89FHZR
	24jkLEoEMShfSYeG9JywmUodBWU0to5rLAKpzPqE/Tx//FP+g/kJT0+g/e7+8hAhweB0
	sES5miKe3ptxdtp58qILNVd0qBg2wfCwDbDu1kIzf52PWQqpwlRVxjDVrN8wM9bRcZ9A
	BBpk6/EhZ8cFWyOFtyKWDK1fjvd4358672V3Uj6K4Xr88mv2+D+1sH77I2G4eO2RJsL6
	KrzvuYuGwNkhPepOtcwgLjxQkx/NA46sL7CgvqESn5Q96VLsh3j/R0jucUXH9LssXdsT
	obAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=8/Gn0utFRmAPxSXpFGHDgnfqJKxWyml3l8N7RpHi2XQ=;
	b=TaE0Kxiy6G6vKPHzyoJrJVs9QGHQeefYYmB7rlsZoGgRujxPSWYoqHKVbc45jg7YI/
	s/RCrsOKXvma056/pJ907zS/OS5KFSkLouXYqE4zleG8bWSX9A5RCiwsX3adAjr9IDBa
	4+4CkZOdku8hA1ym4AXNZ/ZTPzPjuUwNADZKzjo+MCp/M9FMHjdwIfdBe+eIibTqdBwR
	M7w2krsU4igZz3cVT/CekRzD4hchPyt2+DYTDKBnyoodnaety7nYoBYa8PxscBi8mOod
	FJkkkDZJrSlK9TMf8hTvn4ZFofs3pz/yANxYCYm3mkT508q1EWPSbM+mD4u9+soKcEN1
	yJHw==
X-Gm-Message-State: APjAAAW1i6uATUlIEfpMPh7yemqooHOVRiHGrm1vnR34lqxcVyu9urj0
	TDfoQdkV/wl5tAxCtSf2kpJ0RA==
X-Google-Smtp-Source: APXvYqxOwMESplrVMkljpMRzn3ouFOclmQqD/dHtnlO3RuJA42kmeH2Sr/yELt3Z5qOMkdJ1Se48GA==
X-Received: by 2002:a17:90a:3746:: with SMTP id
	u64mr1662124pjb.4.1572939838105; 
	Mon, 04 Nov 2019 23:43:58 -0800 (PST)
Received: from ?IPv6:240e:362:46a:2000:dc7:27ad:6d11:a6a4?
	([240e:362:46a:2000:dc7:27ad:6d11:a6a4])
	by smtp.gmail.com with ESMTPSA id
	r13sm2107668pgh.37.2019.11.04.23.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Nov 2019 23:43:57 -0800 (PST)
Subject: Re: [PATCH v7 2/3] uacce: add uacce driver
To: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <1572331216-9503-1-git-send-email-zhangfei.gao@linaro.org>
	<1572331216-9503-3-git-send-email-zhangfei.gao@linaro.org>
	<20191031171357.000067c7@huawei.com>
From: zhangfei <zhangfei.gao@linaro.org>
Message-ID: <6e427d92-e0c3-e77d-51f4-f7c1ae4d7da7@linaro.org>
Date: Tue, 5 Nov 2019 15:43:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031171357.000067c7@huawei.com>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jean-philippe <jean-philippe@linaro.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Arnd Bergmann <arnd@arndb.de>, francois.ozog@linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ilias.apalodimas@linaro.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>,
	grant.likely@arm.com, "haojian . zhuang" <haojian.zhuang@linaro.org>,
	linux-accelerators@lists.ozlabs.org, linux-crypto@vger.kernel.org,
	Kenneth Lee <liguozhu@hisilicon.com>, guodong.xu@linaro.org,
	kenneth-lee-2012@foxmail.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

SGksIEpvbmF0aGFuCgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9ucwoKT24gMjAxOS8xMS8xIOS4
iuWNiDE6MTMsIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6Cj4gT24gVHVlLCAyOSBPY3QgMjAxOSAx
NDo0MDoxNSArMDgwMAo+IFpoYW5nZmVpIEdhbyA8emhhbmdmZWkuZ2FvQGxpbmFyby5vcmc+IHdy
b3RlOgo+Cj4+IEZyb206IEtlbm5ldGggTGVlIDxsaWd1b3podUBoaXNpbGljb24uY29tPgo+Pgo+
PiBVYWNjZSAoVW5pZmllZC9Vc2VyLXNwYWNlLWFjY2Vzcy1pbnRlbmRlZCBBY2NlbGVyYXRvciBG
cmFtZXdvcmspIHRhcmdldHMgdG8KPj4gcHJvdmlkZSBTaGFyZWQgVmlydHVhbCBBZGRyZXNzaW5n
IChTVkEpIGJldHdlZW4gYWNjZWxlcmF0b3JzIGFuZCBwcm9jZXNzZXMuCj4+IFNvIGFjY2VsZXJh
dG9yIGNhbiBhY2Nlc3MgYW55IGRhdGEgc3RydWN0dXJlIG9mIHRoZSBtYWluIGNwdS4KPj4gVGhp
cyBkaWZmZXJzIGZyb20gdGhlIGRhdGEgc2hhcmluZyBiZXR3ZWVuIGNwdSBhbmQgaW8gZGV2aWNl
LCB3aGljaCBzaGFyZQo+PiBkYXRhIGNvbnRlbnQgcmF0aGVyIHRoYW4gYWRkcmVzcy4KPj4gU2lu
Y2UgdW5pZmllZCBhZGRyZXNzLCBoYXJkd2FyZSBhbmQgdXNlciBzcGFjZSBvZiBwcm9jZXNzIGNh
biBzaGFyZSB0aGUKPj4gc2FtZSB2aXJ0dWFsIGFkZHJlc3MgaW4gdGhlIGNvbW11bmljYXRpb24u
Cj4+Cj4+IFVhY2NlIGNyZWF0ZSBhIGNocmRldiBmb3IgZXZlcnkgcmVnaXN0cmF0aW9uLCB0aGUg
cXVldWUgaXMgYWxsb2NhdGVkIHRvCj4+IHRoZSBwcm9jZXNzIHdoZW4gdGhlIGNocmRldiBpcyBv
cGVuZWQuIFRoZW4gdGhlIHByb2Nlc3MgY2FuIGFjY2VzcyB0aGUKPj4gaGFyZHdhcmUgcmVzb3Vy
Y2UgYnkgaW50ZXJhY3Qgd2l0aCB0aGUgcXVldWUgZmlsZS4gQnkgbW1hcCB0aGUgcXVldWUKPj4g
ZmlsZSBzcGFjZSB0byB1c2VyIHNwYWNlLCB0aGUgcHJvY2VzcyBjYW4gZGlyZWN0bHkgcHV0IHJl
cXVlc3RzIHRvIHRoZQo+PiBoYXJkd2FyZSB3aXRob3V0IHN5c2NhbGwgdG8gdGhlIGtlcm5lbCBz
cGFjZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogS2VubmV0aCBMZWUgPGxpZ3Vvemh1QGhpc2lsaWNv
bi5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFphaWJvIFh1IDx4dXphaWJvQGh1YXdlaS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IFpob3UgV2FuZyA8d2FuZ3pob3UxQGhpc2lsaWNvbi5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IFpoYW5nZmVpIEdhbyA8emhhbmdmZWkuZ2FvQGxpbmFyby5vcmc+Cj4gR3Jl
YXQsIG11Y2ggbW9yZSBjb21wYWN0Lgo+Cj4gSSd2ZSBub3QgZ29uZSB0aHJvdWdoIHRoaXMgaW4g
ZGV0YWlsIHlldCBidXQgYSBmZXcgaW5pdGlhbCBjb21tZW50cyBpbmxpbmUuCj4KPiBUaGFua3Ms
Cj4KPiBKb25hdGhhbgo+Cj4+IC0tLQo+PiAgIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lz
ZnMtZHJpdmVyLXVhY2NlIHwgIDUzICsrKwo+PiAgIGRyaXZlcnMvbWlzYy9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAxICsKPj4gICBkcml2ZXJzL21pc2MvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4+ICAgZHJpdmVycy9taXNjL3VhY2NlL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgfCAgMTMgKwo+PiAgIGRyaXZlcnMvbWlzYy91YWNjZS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgIHwgICAyICsKPj4gICBkcml2ZXJzL21pc2MvdWFjY2UvdWFj
Y2UuYyAgICAgICAgICAgICAgICAgICB8IDU3NCArKysrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4gICBpbmNsdWRlL2xpbnV4L3VhY2NlLmggICAgICAgICAgICAgICAgICAgICAgICB8IDE2MyAr
KysrKysrKwo+PiAgIGluY2x1ZGUvdWFwaS9taXNjL3VhY2NlL3VhY2NlLmggICAgICAgICAgICAg
IHwgIDM4ICsrCj4+ICAgOCBmaWxlcyBjaGFuZ2VkLCA4NDUgaW5zZXJ0aW9ucygrKQo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWRyaXZlci11
YWNjZQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvdWFjY2UvS2NvbmZpZwo+
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvdWFjY2UvTWFrZWZpbGUKPj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL3VhY2NlL3VhY2NlLmMKPj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC91YWNjZS5oCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvdWFwaS9taXNjL3VhY2NlL3VhY2NlLmgKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLXVhY2NlIGIvRG9jdW1lbnRhdGlvbi9B
QkkvdGVzdGluZy9zeXNmcy1kcml2ZXItdWFjY2UKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4g
aW5kZXggMDAwMDAwMC4uMzU2OTlkYwo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLXVhY2NlCj4+IEBAIC0wLDAgKzEsNTMgQEAK
Pj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2NsYXNzL3VhY2NlLzxkZXZfbmFtZT4vaWQKPj4gK0Rh
dGU6ICAgICAgICAgICBPY3QgMjAxOQo+PiArS2VybmVsVmVyc2lvbjogIDUuNQo+PiArQ29udGFj
dDogICAgICAgIGxpbnV4LWFjY2VsZXJhdG9yc0BsaXN0cy5vemxhYnMub3JnCj4+ICtEZXNjcmlw
dGlvbjogICAgSWQgb2YgdGhlIGRldmljZS4KPj4gKwo+PiArV2hhdDogICAgICAgICAgIC9zeXMv
Y2xhc3MvdWFjY2UvPGRldl9uYW1lPi9hcGkKPj4gK0RhdGU6ICAgICAgICAgICBPY3QgMjAxOQo+
PiArS2VybmVsVmVyc2lvbjogIDUuNQo+PiArQ29udGFjdDogICAgICAgIGxpbnV4LWFjY2VsZXJh
dG9yc0BsaXN0cy5vemxhYnMub3JnCj4+ICtEZXNjcmlwdGlvbjogICAgQXBpIG9mIHRoZSBkZXZp
Y2UsIHVzZWQgYnkgYXBwbGljYXRpb24gdG8gbWF0Y2ggdGhlIGNvcnJlY3QgZHJpdmVyCj4+ICsK
Pj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2NsYXNzL3VhY2NlLzxkZXZfbmFtZT4vZmxhZ3MKPj4g
K0RhdGU6ICAgICAgICAgICBPY3QgMjAxOQo+PiArS2VybmVsVmVyc2lvbjogIDUuNQo+PiArQ29u
dGFjdDogICAgICAgIGxpbnV4LWFjY2VsZXJhdG9yc0BsaXN0cy5vemxhYnMub3JnCj4+ICtEZXNj
cmlwdGlvbjogICAgQXR0cmlidXRlcyBvZiB0aGUgZGV2aWNlLCBzZWUgVUFDQ0VfREVWX3h4eCBm
bGFnIGRlZmluZWQgaW4gdWFjY2UuaAo+PiArCj4+ICtXaGF0OiAgICAgICAgICAgL3N5cy9jbGFz
cy91YWNjZS88ZGV2X25hbWU+L2F2YWlsYWJsZV9pbnN0YW5jZXMKPj4gK0RhdGU6ICAgICAgICAg
ICBPY3QgMjAxOQo+PiArS2VybmVsVmVyc2lvbjogIDUuNQo+PiArQ29udGFjdDogICAgICAgIGxp
bnV4LWFjY2VsZXJhdG9yc0BsaXN0cy5vemxhYnMub3JnCj4+ICtEZXNjcmlwdGlvbjogICAgQXZh
aWxhYmxlIGluc3RhbmNlcyBsZWZ0IG9mIHRoZSBkZXZpY2UKPj4gKwo+PiArV2hhdDogICAgICAg
ICAgIC9zeXMvY2xhc3MvdWFjY2UvPGRldl9uYW1lPi9hbGdvcml0aG1zCj4+ICtEYXRlOiAgICAg
ICAgICAgT2N0IDIwMTkKPj4gK0tlcm5lbFZlcnNpb246ICA1LjUKPj4gK0NvbnRhY3Q6ICAgICAg
ICBsaW51eC1hY2NlbGVyYXRvcnNAbGlzdHMub3psYWJzLm9yZwo+PiArRGVzY3JpcHRpb246ICAg
IEFsZ29yaXRobXMgc3VwcG9ydGVkIGJ5IHRoaXMgYWNjZWxlcmF0b3IKPiBIb3cgYXJlIHRoZXkg
c2VwYXJhdGVkPyAgVXNlcnNwYWNlIGNvZGUgbmVlZHMgdG8ga25vdyB0aGF0Lgo+IChjb21tYSwg
dGFiLCBuZXdsaW5lPykKWWVzLCB3aWxsIGFkZCAic2VwYXJhdGVkIGJ5IG5ldyBsaW5lIgo+Cj4+
ICsKPj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2NsYXNzL3VhY2NlLzxkZXZfbmFtZT4vcWZydF9t
bWlvX3NpemUKPiBxZnJ0IGlzIG5vdCB0aGUgbW9zdCBvYnZpb3VzIG5hbWluZyBldmVyLiAgRG8g
d2UgY2FyZSBiZXlvbmQgaXRzCj4gYSByZWdpb24gZm9yIHRoaXMgaW50ZXJmYWNlPyAgcmVnaW9u
X21taW9fc2l6ZSBtYXliZT8KT0ssCj4KPj4gK0RhdGU6ICAgICAgICAgICBPY3QgMjAxOQo+PiAr
S2VybmVsVmVyc2lvbjogIDUuNQo+PiArQ29udGFjdDogICAgICAgIGxpbnV4LWFjY2VsZXJhdG9y
c0BsaXN0cy5vemxhYnMub3JnCj4+ICtEZXNjcmlwdGlvbjogICAgUGFnZSBzaXplIG9mIG1taW8g
cmVnaW9uIHF1ZXVlIGZpbGUKPiBTaXplIG9mIHBhZ2UgaW4gdGhpcyByZWdpb24sIG9yIG51bWJl
ciBvZiBwYWdlcyBpbiB0aGUgcmVnaW9uPwpDaGFuZ2UgdG8gIlBhZ2UgbnVtYmVycyBvZiBtbWlv
IHJlZ2lvbiBxdWV1ZSBmaWxlIgo+Cj4+ICsKPj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2NsYXNz
L3VhY2NlLzxkZXZfbmFtZT4vcWZydF9kdXNfc2l6ZQo+PiArRGF0ZTogICAgICAgICAgIE9jdCAy
MDE5Cj4+ICtLZXJuZWxWZXJzaW9uOiAgNS41Cj4+ICtDb250YWN0OiAgICAgICAgbGludXgtYWNj
ZWxlcmF0b3JzQGxpc3RzLm96bGFicy5vcmcKPj4gK0Rlc2NyaXB0aW9uOiAgICBQYWdlIHNpemUg
b2YgZHVzIHJlZ2lvbiBxdWV1ZSBmaWxlCj4+ICsKPj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2Ns
YXNzL3VhY2NlLzxkZXZfbmFtZT4vbnVtYV9kaXN0YW5jZQo+PiArRGF0ZTogICAgICAgICAgIE9j
dCAyMDE5Cj4+ICtLZXJuZWxWZXJzaW9uOiAgNS41Cj4+ICtDb250YWN0OiAgICAgICAgbGludXgt
YWNjZWxlcmF0b3JzQGxpc3RzLm96bGFicy5vcmcKPj4gK0Rlc2NyaXB0aW9uOiAgICBEaXN0YW5j
ZSBvZiBkZXZpY2Ugbm9kZSB0byBjcHUgbm9kZQo+IEkgd29uZGVyIGlmIHdlIHNob3VsZCBiZSBk
b2luZyB0aGlzIGluIGhlcmUuIFRoZXJlIGFyZSBvdGhlciBzdGFuZGFyZAo+IHdheXMgb2Ygb2J0
YWluaW5nIHRoaXMgZm9yIHRoZSBkZXZpY2UuICBGb2xsb3cgcGFyZW50IGFuZCBjaGVjayBub2Rl
X2lkCj4gdGhlcmUgdGhlbiB1c2UgdGhlIC9zeXMvYnVzL25vZGUgcGF0aCB0byBmaW5kIG91dCB0
aGUgZGlzdGFuY2VzLgpDb3VsZCB5b3UgY2xhcmlmeSBtb3JlIGFib3V0IHRoaXMgbWV0aG9kLgpU
aGUgcHVycG9zZSBoZXJlIGlzIGNwdSBzZWFyY2hpbmcgdGhlIG5lYXJlc3QgZGV2aWNlKHppcCkg
ZG9pbmcgd29yay4KRG9lcyB1c2VyIGFwcGxpY2F0aW9uIGtub3cgd2hpY2ggbm9kZSBpdCBpcyBy
dW5uaW5nIGFuZCBjb21wYXJlIGRpc3RhbmNlPwo+PiArCj4+ICtXaGF0OiAgICAgICAgICAgL3N5
cy9jbGFzcy91YWNjZS88ZGV2X25hbWU+L25vZGVfaWQKPj4gK0RhdGU6ICAgICAgICAgICBPY3Qg
MjAxOQo+PiArS2VybmVsVmVyc2lvbjogIDUuNQo+PiArQ29udGFjdDogICAgICAgIGxpbnV4LWFj
Y2VsZXJhdG9yc0BsaXN0cy5vemxhYnMub3JnCj4+ICtEZXNjcmlwdGlvbjogICAgSWQgb2YgdGhl
IG51bWEgbm9kZQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL0tjb25maWcgYi9kcml2ZXJz
L21pc2MvS2NvbmZpZwo+PiBpbmRleCBjNTViNjM3Li45MjlmZWIwIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL21pc2MvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL21pc2MvS2NvbmZpZwo+PiBAQCAt
NDgxLDQgKzQ4MSw1IEBAIHNvdXJjZSAiZHJpdmVycy9taXNjL2N4bC9LY29uZmlnIgo+PiAgIHNv
dXJjZSAiZHJpdmVycy9taXNjL29jeGwvS2NvbmZpZyIKPj4gICBzb3VyY2UgImRyaXZlcnMvbWlz
Yy9jYXJkcmVhZGVyL0tjb25maWciCj4+ICAgc291cmNlICJkcml2ZXJzL21pc2MvaGFiYW5hbGFi
cy9LY29uZmlnIgo+PiArc291cmNlICJkcml2ZXJzL21pc2MvdWFjY2UvS2NvbmZpZyIKPj4gICBl
bmRtZW51Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvTWFrZWZpbGUgYi9kcml2ZXJzL21p
c2MvTWFrZWZpbGUKPj4gaW5kZXggYzE4NjBkMy4uOWFiZjI5MiAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9taXNjL01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvbWlzYy9NYWtlZmlsZQo+PiBAQCAt
NTYsNCArNTYsNSBAQCBvYmotJChDT05GSUdfT0NYTCkJCSs9IG9jeGwvCj4+ICAgb2JqLXkJCQkJ
Kz0gY2FyZHJlYWRlci8KPj4gICBvYmotJChDT05GSUdfUFZQQU5JQykgICAJKz0gcHZwYW5pYy5v
Cj4+ICAgb2JqLSQoQ09ORklHX0hBQkFOQV9BSSkJCSs9IGhhYmFuYWxhYnMvCj4+ICtvYmotJChD
T05GSUdfVUFDQ0UpCQkrPSB1YWNjZS8KPj4gICBvYmotJChDT05GSUdfWElMSU5YX1NERkVDKQkr
PSB4aWxpbnhfc2RmZWMubwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL3VhY2NlL0tjb25m
aWcgYi9kcml2ZXJzL21pc2MvdWFjY2UvS2NvbmZpZwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
PiBpbmRleCAwMDAwMDAwLi41ZTM5YjYwCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvZHJpdmVy
cy9taXNjL3VhY2NlL0tjb25maWcKPj4gQEAgLTAsMCArMSwxMyBAQAo+PiArY29uZmlnIFVBQ0NF
Cj4+ICsJdHJpc3RhdGUgIkFjY2VsZXJhdG9yIEZyYW1ld29yayBmb3IgVXNlciBMYW5kIgo+PiAr
CWRlcGVuZHMgb24gSU9NTVVfQVBJCj4+ICsJaGVscAo+PiArCSAgVUFDQ0UgcHJvdmlkZXMgaW50
ZXJmYWNlIGZvciB0aGUgdXNlciBwcm9jZXNzIHRvIGFjY2VzcyB0aGUgaGFyZHdhcmUKPj4gKwkg
IHdpdGhvdXQgaW50ZXJhY3Rpb24gd2l0aCB0aGUga2VybmVsIHNwYWNlIGluIGRhdGEgcGF0aC4K
Pj4gKwo+PiArCSAgVGhlIHVzZXItc3BhY2UgaW50ZXJmYWNlIGlzIGRlc2NyaWJlZCBpbgo+PiAr
CSAgaW5jbHVkZS91YXBpL21pc2MvdWFjY2UvdWFjY2UuaAo+PiArCj4+ICsJICBTZWUgRG9jdW1l
bnRhdGlvbi9taXNjLWRldmljZXMvdWFjY2UucnN0IGZvciBtb3JlIGRldGFpbHMuCj4+ICsKPj4g
KwkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IE4uCj4gUGVzc2ltaXN0
IDopIEV2ZXJ5b25lIHNob3VsZCB3YW50IHVhY2NlIHNvIGRvbid0IHB1dCB0aGVtIG9mZi4gIEhh
dmluZyBzYWlkCj4gdGhhdCBwZXJoYXBzIGZvciBub3cgaXQgc2hvdWxkIGJlIGhpZGRlbiBhbmQg
ZW5hYmxlZCBvbiBhIGRyaXZlciBieSBkcml2ZXIKPiBiYXNpcz8KPgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9taXNjL3VhY2NlL01ha2VmaWxlIGIvZHJpdmVycy9taXNjL3VhY2NlL01ha2VmaWxl
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAuLjViNDM3NGUKPj4gLS0t
IC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL21pc2MvdWFjY2UvTWFrZWZpbGUKPj4gQEAgLTAs
MCArMSwyIEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVy
Cj4+ICtvYmotJChDT05GSUdfVUFDQ0UpICs9IHVhY2NlLm8KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWlzYy91YWNjZS91YWNjZS5jIGIvZHJpdmVycy9taXNjL3VhY2NlL3VhY2NlLmMKPj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMC4uMmI2YjAzOAo+PiAtLS0gL2Rldi9u
dWxsCj4+ICsrKyBiL2RyaXZlcnMvbWlzYy91YWNjZS91YWNjZS5jCj4+IEBAIC0wLDAgKzEsNTc0
IEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+PiAr
I2luY2x1ZGUgPGxpbnV4L2NvbXBhdC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2RtYS1pb21tdS5o
Pgo+PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3BvbGwu
aD4KPj4gKyNpbmNsdWRlIDxsaW51eC91YWNjZS5oPgo+PiArCj4+ICtzdGF0aWMgc3RydWN0IGNs
YXNzICp1YWNjZV9jbGFzczsKPj4gK3N0YXRpYyBkZXZfdCB1YWNjZV9kZXZ0Owo+PiArc3RhdGlj
IERFRklORV9NVVRFWCh1YWNjZV9tdXRleCk7Cj4+ICtzdGF0aWMgREVGSU5FX1hBUlJBWV9BTExP
Qyh1YWNjZV94YSk7Cj4+ICsKPj4gK3N0YXRpYyBpbnQgdWFjY2Vfc3RhcnRfcXVldWUoc3RydWN0
IHVhY2NlX3F1ZXVlICpxKQo+PiArewo+PiArCWludCByZXQgPSAtRUlOVkFMOwo+PiArCj4+ICsJ
bXV0ZXhfbG9jaygmdWFjY2VfbXV0ZXgpOwo+PiArCj4+ICsJaWYgKHEtPnN0YXRlICE9IFVBQ0NF
X1FfSU5JVCkKPj4gKwkJZ290byBvdXRfd2l0aF9sb2NrOwo+PiArCj4+ICsJaWYgKHEtPnVhY2Nl
LT5vcHMtPnN0YXJ0X3F1ZXVlKSB7Cj4+ICsJCXJldCA9IHEtPnVhY2NlLT5vcHMtPnN0YXJ0X3F1
ZXVlKHEpOwo+PiArCQlpZiAocmV0IDwgMCkKPj4gKwkJCWdvdG8gb3V0X3dpdGhfbG9jazsKPj4g
Kwl9Cj4+ICsKPj4gKwlxLT5zdGF0ZSA9IFVBQ0NFX1FfU1RBUlRFRDsKPiBvdXRfd2l0aF9sb2Nr
Ogo+PiArCW11dGV4X3VubG9jaygmdWFjY2VfbXV0ZXgpOwo+PiArCj4gcmV0dXJuIHJldDsKPiBU
aG91Z2ggbmVlZCB0byBoYW5kbGUgcmV0IGEgYml0IGRpZmZlcmVudGx5IGFib3ZlLi4uCk9LCj4K
PiArc3RhdGljIGludCB1YWNjZV9mb3BzX21tYXAoc3RydWN0IGZpbGUgKmZpbGVwLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiArewo+ICsJc3RydWN0IHVhY2NlX3F1ZXVlICpxID0gZmls
ZXAtPnByaXZhdGVfZGF0YTsKPiArCXN0cnVjdCB1YWNjZV9kZXZpY2UgKnVhY2NlID0gcS0+dWFj
Y2U7Cj4gKwlzdHJ1Y3QgdWFjY2VfcWZpbGVfcmVnaW9uICpxZnI7Cj4gKwllbnVtIHVhY2NlX3Fm
cnQgdHlwZSA9IDA7Cj4gKwl1bnNpZ25lZCBpbnQgZmxhZ3MgPSAwOwo+ICsJaW50IHJldDsKPiAr
Cj4gKwlpZiAodm1hLT52bV9wZ29mZiA8IFVBQ0NFX1FGUlRfTUFYKQo+ICsJCXR5cGUgPSB2bWEt
PnZtX3Bnb2ZmOwo+ICsKPiArCXZtYS0+dm1fZmxhZ3MgfD0gVk1fRE9OVENPUFkgfCBWTV9ET05U
RVhQQU5EIHwgVk1fV0lQRU9ORk9SSzsKPiArCXZtYS0+dm1fb3BzID0gJnVhY2NlX3ZtX29wczsK
PiArCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gcTsKPiArCj4gKwltdXRleF9sb2NrKCZ1YWNjZV9t
dXRleCk7Cj4gKwo+ICsJaWYgKHEtPnFmcnNbdHlwZV0pIHsKPiArCQlyZXQgPSAtRUVYSVNUOwo+
ICsJCWdvdG8gb3V0X3dpdGhfbG9jazsKPiArCX0KPiArCj4gKwlzd2l0Y2ggKHR5cGUpIHsKPiAr
CWNhc2UgVUFDQ0VfUUZSVF9NTUlPOgo+ICsJCWZsYWdzID0gVUFDQ0VfUUZSRl9TRUxGTVQ7Cj4g
KwkJYnJlYWs7Cj4gKwo+ICsJY2FzZSBVQUNDRV9RRlJUX0RVUzoKPiArCQlpZiAodWFjY2UtPmZs
YWdzICYgVUFDQ0VfREVWX1NWQSkgewo+ICsJCQlmbGFncyA9IFVBQ0NFX1FGUkZfU0VMRk1UOwo+
ICsJCQlicmVhazsKPiArCQl9Cj4gKwkJYnJlYWs7Cj4gKwo+ICsJZGVmYXVsdDoKPiArCQlXQVJO
X09OKCZ1YWNjZS0+ZGV2KTsKPiArCQlicmVhazsKPiArCX0KPiArCj4gKwlxZnIgPSB1YWNjZV9j
cmVhdGVfcmVnaW9uKHEsIHZtYSwgdHlwZSwgZmxhZ3MpOwo+ICsJaWYgKElTX0VSUihxZnIpKSB7
Cj4gKwkJcmV0ID0gUFRSX0VSUihxZnIpOwo+ICsJCWdvdG8gb3V0X3dpdGhfbG9jazsKPiArCX0K
PiArCXEtPnFmcnNbdHlwZV0gPSBxZnI7Cj4gKwo+IENvdWxkIHB1dAo+IG91dF93aXRoX2xvY2s6
Cj4gaGVyZSBhbmQgcmV0dXJuIHJldCBpbnN0ZWFkIG9mIDAuCj4gWW91J2xsIG5lZWQgdG8gc2V0
IHJldCB0byBkZWZhdWx0IHRvIDAgaW4gdGhhdAo+IGNhc2UgdGhvdWdoLgpPSwo+Cj4gK3N0YXRp
YyBzc2l6ZV90IGFsZ29yaXRobXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJCSAgICAg
ICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQo+ICt7Cj4gKwlzdHJ1
Y3QgdWFjY2VfZGV2aWNlICp1YWNjZSA9IHRvX3VhY2NlX2RldmljZShkZXYpOwo+ICsKPiArCXJl
dHVybiBzcHJpbnRmKGJ1ZiwgIiVzIiwgdWFjY2UtPmFsZ3MpOwo+IEFueSByaXNrIGFsZ3Mgd29u
J3QgaGF2ZSB0aGUgXG4/Cj4gSSdkIGtpbmQgb2YgZXhwZWN0IGl0IHRvIGJlIGEgbnVsbCB0ZXJt
YXRlZCBhcnJheXMgdG8gYWxsb3cgdGhlIGNvcmUKPiB0byBmb3JtYXQgaXQgaG93ZXZlciBpdCB3
YW50cyB0by4KWWVzLCBhZGRpbmcgXG4gaXMgYmV0dGVyLgo+Cj4+ICt9Cj4+ICsKPj4gK3N0YXRp
YyBzc2l6ZV90IHFmcnRfbW1pb19zaXplX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+PiArCQkJ
CSAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4+ICt7Cj4+ICsJ
c3RydWN0IHVhY2NlX2RldmljZSAqdWFjY2UgPSB0b191YWNjZV9kZXZpY2UoZGV2KTsKPj4gKwo+
PiArCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsdVxuIiwKPj4gKwkJICAgICAgIHVhY2NlLT5xZl9w
Z19zaXplW1VBQ0NFX1FGUlRfTU1JT10gPDwgUEFHRV9TSElGVCk7Cj4+ICt9Cj4+ICsKPj4gK3N0
YXRpYyBzc2l6ZV90IHFmcnRfZHVzX3NpemVfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ICsJ
CQkJICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQo+PiArewo+PiAr
CXN0cnVjdCB1YWNjZV9kZXZpY2UgKnVhY2NlID0gdG9fdWFjY2VfZGV2aWNlKGRldik7Cj4+ICsK
Pj4gKwlyZXR1cm4gc3ByaW50ZihidWYsICIlbHVcbiIsCj4+ICsJCSAgICAgICB1YWNjZS0+cWZf
cGdfc2l6ZVtVQUNDRV9RRlJUX0RVU10gPDwgUEFHRV9TSElGVCk7Cj4+ICt9Cj4+ICsKPj4gK3N0
YXRpYyBERVZJQ0VfQVRUUl9STyhpZCk7Cj4+ICtzdGF0aWMgREVWSUNFX0FUVFJfUk8oYXBpKTsK
Pj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhudW1hX2Rpc3RhbmNlKTsKPj4gK3N0YXRpYyBERVZJ
Q0VfQVRUUl9STyhub2RlX2lkKTsKPj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhmbGFncyk7Cj4+
ICtzdGF0aWMgREVWSUNFX0FUVFJfUk8oYXZhaWxhYmxlX2luc3RhbmNlcyk7Cj4+ICtzdGF0aWMg
REVWSUNFX0FUVFJfUk8oYWxnb3JpdGhtcyk7Cj4+ICtzdGF0aWMgREVWSUNFX0FUVFJfUk8ocWZy
dF9tbWlvX3NpemUpOwo+PiArc3RhdGljIERFVklDRV9BVFRSX1JPKHFmcnRfZHVzX3NpemUpOwo+
PiArCj4+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqdWFjY2VfZGV2X2F0dHJzW10gPSB7Cj4+
ICsJJmRldl9hdHRyX2lkLmF0dHIsCj4+ICsJJmRldl9hdHRyX2FwaS5hdHRyLAo+PiArCSZkZXZf
YXR0cl9ub2RlX2lkLmF0dHIsCj4+ICsJJmRldl9hdHRyX251bWFfZGlzdGFuY2UuYXR0ciwKPj4g
KwkmZGV2X2F0dHJfZmxhZ3MuYXR0ciwKPj4gKwkmZGV2X2F0dHJfYXZhaWxhYmxlX2luc3RhbmNl
cy5hdHRyLAo+PiArCSZkZXZfYXR0cl9hbGdvcml0aG1zLmF0dHIsCj4+ICsJJmRldl9hdHRyX3Fm
cnRfbW1pb19zaXplLmF0dHIsCj4+ICsJJmRldl9hdHRyX3FmcnRfZHVzX3NpemUuYXR0ciwKPj4g
KwlOVUxMLAo+PiArfTsKPj4gK0FUVFJJQlVURV9HUk9VUFModWFjY2VfZGV2KTsKPj4gKwo+PiAr
c3RhdGljIHZvaWQgdWFjY2VfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICt7Cj4+ICsJ
c3RydWN0IHVhY2NlX2RldmljZSAqdWFjY2UgPSB0b191YWNjZV9kZXZpY2UoZGV2KTsKPj4gKwo+
PiArCWtmcmVlKHVhY2NlKTsKPj4gK30KPj4gKwo+PiArLyoqCj4+ICsgKiB1YWNjZV9yZWdpc3Rl
ciAtIHJlZ2lzdGVyIGFuIGFjY2VsZXJhdG9yCj4gVGhpcyBpc24ndCBxdWl0ZSBjb3JyZWN0IGtl
cm5lbC1kb2MuICBQbGVhc2UgcnVuIHRoZQo+IGdlbmVyYXRpb24gc2NyaXB0IG92ZXIgaXQgYW5k
IGZpeCBhbnkgd2FybmluZ3MuCj4KPiAJdWFjY2VfcmVnaXN0ZXIoKSAtIHJlZ2lzdGVyIGFuIGFj
Y2VsZXJhdG9yClN1cmUsIHdpbGwgYWRkICgpLCB0aG91Z2ggbm8gd2FybmluZyByZXBvcnRlZCBm
cm9tIC4vc2NyaXB0cy9rZXJuZWwtZG9jCj4KPj4gKyAqIEBwYXJlbnQ6IHBvaW50ZXIgb2YgdWFj
Y2UgcGFyZW50IGRldmljZQo+PiArICogQGludGVyZmFjZTogcG9pbnRlciBvZiB1YWNjZV9pbnRl
cmZhY2UgZm9yIHJlZ2lzdGVyCj4+ICsgKi8KPj4gK3N0cnVjdCB1YWNjZV9kZXZpY2UgKnVhY2Nl
X3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwKPj4gKwkJCQkgICAgc3RydWN0IHVhY2Nl
X2ludGVyZmFjZSAqaW50ZXJmYWNlKQo+PiArewo+PiArCXVuc2lnbmVkIGludCBmbGFncyA9IGlu
dGVyZmFjZS0+ZmxhZ3M7Cj4+ICsJc3RydWN0IHVhY2NlX2RldmljZSAqdWFjY2U7Cj4+ICsJaW50
IHJldDsKPj4gKwo+PiArCXVhY2NlID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHVhY2NlX2Rldmlj
ZSksIEdGUF9LRVJORUwpOwo+PiArCWlmICghdWFjY2UpCj4+ICsJCXJldHVybiBFUlJfUFRSKC1F
Tk9NRU0pOwo+PiArCj4+ICsJaWYgKGZsYWdzICYgVUFDQ0VfREVWX1NWQSkgewo+PiArCQlyZXQg
PSBpb21tdV9kZXZfZW5hYmxlX2ZlYXR1cmUocGFyZW50LCBJT01NVV9ERVZfRkVBVF9TVkEpOwo+
PiArCQlpZiAocmV0KQo+PiArCQkJZmxhZ3MgJj0gflVBQ0NFX0RFVl9TVkE7Cj4+ICsJfQo+PiAr
Cj4+ICsJdWFjY2UtPnBkZXYgPSBwYXJlbnQ7Cj4+ICsJdWFjY2UtPmZsYWdzID0gZmxhZ3M7Cj4+
ICsJdWFjY2UtPm9wcyA9IGludGVyZmFjZS0+b3BzOwo+PiArCj4+ICsJcmV0ID0geGFfYWxsb2Mo
JnVhY2NlX3hhLCAmdWFjY2UtPmRldl9pZCwgdWFjY2UsIHhhX2xpbWl0XzMyYiwKPj4gKwkJICAg
ICAgIEdGUF9LRVJORUwpOwo+PiArCWlmIChyZXQgPCAwKQo+PiArCQlnb3RvIGVycl93aXRoX3Vh
Y2NlOwo+PiArCj4+ICsJdWFjY2UtPmNkZXYgPSBjZGV2X2FsbG9jKCk7Cj4gSWYgd2UgY2FuIGVt
YmVkIHRoaXMgKHNlZSBiZWxvdykgdGhlbiB1c2UgY2Rldl9pbml0IGluc3RlYWQuCj4KPj4gKwlp
ZiAoIXVhY2NlLT5jZGV2KSB7Cj4+ICsJCXJldCA9IC1FTk9NRU07Cj4+ICsJCWdvdG8gZXJyX3dp
dGhfeGE7Cj4+ICsJfQo+PiArCj4+ICsJSU5JVF9MSVNUX0hFQUQoJnVhY2NlLT5xcyk7Cj4+ICsJ
bXV0ZXhfaW5pdCgmdWFjY2UtPnFfbG9jayk7Cj4+ICsJdWFjY2UtPmNkZXYtPm9wcyA9ICZ1YWNj
ZV9mb3BzOwo+PiArCXVhY2NlLT5jZGV2LT5vd25lciA9IFRISVNfTU9EVUxFOwo+PiArCWRldmlj
ZV9pbml0aWFsaXplKCZ1YWNjZS0+ZGV2KTsKPj4gKwl1YWNjZS0+ZGV2LmRldnQgPSBNS0RFVihN
QUpPUih1YWNjZV9kZXZ0KSwgdWFjY2UtPmRldl9pZCk7Cj4+ICsJdWFjY2UtPmRldi5jbGFzcyA9
IHVhY2NlX2NsYXNzOwo+PiArCXVhY2NlLT5kZXYuZ3JvdXBzID0gdWFjY2VfZGV2X2dyb3VwczsK
Pj4gKwl1YWNjZS0+ZGV2LnBhcmVudCA9IHVhY2NlLT5wZGV2Owo+PiArCXVhY2NlLT5kZXYucmVs
ZWFzZSA9IHVhY2NlX3JlbGVhc2U7Cj4+ICsJZGV2X3NldF9uYW1lKCZ1YWNjZS0+ZGV2LCAiJXMt
JWQiLCBpbnRlcmZhY2UtPm5hbWUsIHVhY2NlLT5kZXZfaWQpOwo+PiArCXJldCA9IGNkZXZfZGV2
aWNlX2FkZCh1YWNjZS0+Y2RldiwgJnVhY2NlLT5kZXYpOwo+PiArCWlmIChyZXQpCj4+ICsJCWdv
dG8gZXJyX3dpdGhfeGE7Cj4+ICsKPj4gKwlyZXR1cm4gdWFjY2U7Cj4+ICsKPj4gK2Vycl93aXRo
X3hhOgo+PiArCWlmICh1YWNjZS0+Y2RldikKPj4gKwkJY2Rldl9kZWwodWFjY2UtPmNkZXYpOwo+
IFdoeSBub3QgdXNlIGEgc2VwYXJhdGUgbGFiZWwgdG8gaGFuZGxlIHRoZSBhYm92ZSByYXRoZXIg
dGhhbiBjaGVja2luZyBpZgo+IGl0J3Mgc2V0PwpvaywKPgo+PiArCXhhX2VyYXNlKCZ1YWNjZV94
YSwgdWFjY2UtPmRldl9pZCk7Cj4+ICtlcnJfd2l0aF91YWNjZToKPj4gKwlpZiAoZmxhZ3MgJiBV
QUNDRV9ERVZfU1ZBKQo+PiArCQlpb21tdV9kZXZfZGlzYWJsZV9mZWF0dXJlKHVhY2NlLT5wZGV2
LCBJT01NVV9ERVZfRkVBVF9TVkEpOwo+PiArCWtmcmVlKHVhY2NlKTsKPj4gKwlyZXR1cm4gRVJS
X1BUUihyZXQpOwo+PiArfQo+PiArRVhQT1JUX1NZTUJPTF9HUEwodWFjY2VfcmVnaXN0ZXIpOwo+
PiArCj4+ICsvKioKPj4gKyAqIHVhY2NlX3VucmVnaXN0ZXIgLSB1bnJlZ2lzdGVycyBhbiBhY2Nl
bGVyYXRvcgo+PiArICogQHVhY2NlOiB0aGUgYWNjZWxlcmF0b3IgdG8gdW5yZWdpc3Rlcgo+PiAr
ICovCj4+ICt2b2lkIHVhY2NlX3VucmVnaXN0ZXIoc3RydWN0IHVhY2NlX2RldmljZSAqdWFjY2Up
Cj4+ICt7Cj4+ICsJaWYgKCF1YWNjZSkKPj4gKwkJcmV0dXJuOwo+PiArCj4gSSdkIGxpa2UgdG8g
c2VlIGEgY29tbWVudCBoZXJlIG9uIHdoeSB3ZSBhcmUgZG9pbmcgdGhpbmdzIG5vdCB1bndpbmRp
bmcKPiBhY3Rpb25zIGZyb20gdWFjY2VfcmVnaXN0ZXIuCk9LIHdpbGwgYWRkIGNvbW1lbnRzLgpI
ZXJlIGlzICJlbnN1cmUgbm8gb3BlbiBxdWV1ZSByZW1haW5zIgo+PiArCW11dGV4X2xvY2soJnVh
Y2NlLT5xX2xvY2spOwo+PiArCWlmICghbGlzdF9lbXB0eSgmdWFjY2UtPnFzKSkgewo+PiArCQlz
dHJ1Y3QgdWFjY2VfcXVldWUgKnE7Cj4+ICsKPj4gKwkJbGlzdF9mb3JfZWFjaF9lbnRyeShxLCAm
dWFjY2UtPnFzLCBsaXN0KSB7Cj4+ICsJCQl1YWNjZV9wdXRfcXVldWUocSk7Cj4+ICsJCQlpZiAo
dWFjY2UtPmZsYWdzICYgVUFDQ0VfREVWX1NWQSkKPj4gKwkJCQlpb21tdV9zdmFfdW5iaW5kX2Rl
dmljZShxLT5oYW5kbGUpOwo+PiArCQl9Cj4+ICsJfQo+PiArCW11dGV4X3VubG9jaygmdWFjY2Ut
PnFfbG9jayk7Cj4+ICsKPiBGb3IgdGhlc2UgbmV4dCBwYXJ0cyB3aGljaCBhcmUgdGhlIHVud2lu
ZCBvZiB1YWNjZV9yZWdpc3Rlciwgd2h5IGFyZSB0aGV5IG5vdAo+IGluIHRoZSByZXZlcnNlIG9y
ZGVyIG9mIHdoYXQgaXMgaGFwcGVuaW5nIGluIHRoZXJlICh3aGVyZSBwb3NzaWJsZSBnaXZlbgo+
IGRldmljZSBsaWZlc3BhbikuIFRoYXQgaXMgd2h5IGRvIHdlIG5vdCBkaXNhYmxlIHRoZSBpb21t
dSBmZWF0dXJlIG11Y2ggbGF0ZXI/CkZpcnN0IGNsb3NlIGFsbCBxdWV1ZXMsIHRoZW4gZGlzYWJs
ZSBzdmEgZmVhdHVyZS4KPgo+PiArCWlmICh1YWNjZS0+ZmxhZ3MgJiBVQUNDRV9ERVZfU1ZBKQo+
PiArCQlpb21tdV9kZXZfZGlzYWJsZV9mZWF0dXJlKHVhY2NlLT5wZGV2LCBJT01NVV9ERVZfRkVB
VF9TVkEpOwo+PiArCj4+ICsJY2Rldl9kZXZpY2VfZGVsKHVhY2NlLT5jZGV2LCAmdWFjY2UtPmRl
dik7Cj4+ICsJeGFfZXJhc2UoJnVhY2NlX3hhLCB1YWNjZS0+ZGV2X2lkKTsKPj4gKwlwdXRfZGV2
aWNlKCZ1YWNjZS0+ZGV2KTsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0xfR1BMKHVhY2NlX3VucmVn
aXN0ZXIpOwo+PiArCj4+ICtzdGF0aWMgaW50IF9faW5pdCB1YWNjZV9pbml0KHZvaWQpCj4+ICt7
Cj4+ICsJaW50IHJldDsKPj4gKwo+PiArCXVhY2NlX2NsYXNzID0gY2xhc3NfY3JlYXRlKFRISVNf
TU9EVUxFLCBVQUNDRV9OQU1FKTsKPj4gKwlpZiAoSVNfRVJSKHVhY2NlX2NsYXNzKSkKPj4gKwkJ
cmV0dXJuIFBUUl9FUlIodWFjY2VfY2xhc3MpOwo+PiArCj4+ICsJcmV0ID0gYWxsb2NfY2hyZGV2
X3JlZ2lvbigmdWFjY2VfZGV2dCwgMCwgTUlOT1JNQVNLLCBVQUNDRV9OQU1FKTsKPj4gKwlpZiAo
cmV0KSB7Cj4+ICsJCWNsYXNzX2Rlc3Ryb3kodWFjY2VfY2xhc3MpOwo+PiArCQlyZXR1cm4gcmV0
Owo+IGRyb3AgdGhlIHJldHVybiByZXQgb3V0IG9mIHRoZXNlIGJyYWNrZXRzLiBpLmUuCj4KPiBp
ZiAocmV0KQo+IAljbGFzc19kZXN0cm95KHVhY2NlX2NsYXNzKQo+Cj4gcmV0dXJuIHJldDsKc3Vy
ZSwgdGhhbmtzCj4KPj4gKwl9Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3Rh
dGljIF9fZXhpdCB2b2lkIHVhY2NlX2V4aXQodm9pZCkKPj4gK3sKPj4gKwl1bnJlZ2lzdGVyX2No
cmRldl9yZWdpb24odWFjY2VfZGV2dCwgTUlOT1JNQVNLKTsKPj4gKwljbGFzc19kZXN0cm95KHVh
Y2NlX2NsYXNzKTsKPj4gK30KPj4gKwo+PiArc3Vic3lzX2luaXRjYWxsKHVhY2NlX2luaXQpOwo+
PiArbW9kdWxlX2V4aXQodWFjY2VfZXhpdCk7Cj4+ICsKPj4gK01PRFVMRV9MSUNFTlNFKCJHUEwi
KTsKPj4gK01PRFVMRV9BVVRIT1IoIkhpc2lsaWNvbiBUZWNoLiBDby4sIEx0ZC4iKTsKPj4gK01P
RFVMRV9ERVNDUklQVElPTigiQWNjZWxlcmF0b3IgaW50ZXJmYWNlIGZvciBVc2VybGFuZCBhcHBs
aWNhdGlvbnMiKTsKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdWFjY2UuaCBiL2luY2x1
ZGUvbGludXgvdWFjY2UuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
Li4wNGM4NjQzCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvaW5jbHVkZS9saW51eC91YWNjZS5o
Cj4+IEBAIC0wLDAgKzEsMTYzIEBACj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlciAqLwo+PiArI2lmbmRlZiBfTElOVVhfVUFDQ0VfSAo+PiArI2RlZmluZSBf
TElOVVhfVUFDQ0VfSAo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgvY2Rldi5oPgo+PiArI2luY2x1
ZGUgPHVhcGkvbWlzYy91YWNjZS91YWNjZS5oPgo+PiArCj4+ICsjZGVmaW5lIFVBQ0NFX05BTUUJ
CSJ1YWNjZSIKPj4gKyNkZWZpbmUgVUFDQ0VfUUZSVF9NQVgJCTE2Cj4gV2hhdCBkb2VzIFFGUlQg
c3RhbmQgZm9yPwpjaGFuZ2UgdG8gVUFDQ0VfTUFYX1JFR0lPTgo+PiArI2RlZmluZSBVQUNDRV9N
QVhfTkFNRV9TSVpFCTY0Cj4+ICsKPj4gK3N0cnVjdCB1YWNjZV9xdWV1ZTsKPj4gK3N0cnVjdCB1
YWNjZV9kZXZpY2U7Cj4+ICsKPj4gKy8qKgo+PiArICogZW51bSB1YWNjZV9xZnJfZmxhZzogcXVl
dWUgZmlsZSBmbGFnOgo+PiArICogQFVBQ0NFX1FGUkZfU0VMRk1UOiBzZWxmIG1haW50YWluZWQg
cWZyCj4+ICsgKi8KPj4gK2VudW0gdWFjY2VfcWZyX2ZsYWcgewo+PiArCVVBQ0NFX1FGUkZfU0VM
Rk1UID0gQklUKDApLAo+PiArfTsKPiBTYW1lIGlzc3VlIHdpdGggZW51bXMgZm9yIGZsYWdzLiAg
RG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgdG8gbWUuCj4gT25seSBvbmUgdmFsdWUgY2FuIGJlIHRh
a2VuIHdoaWNoIGRvZXNuJ3QgbWFrZSBpdCBhIGZsYWcuCj4KPj4gKwo+PiArLyoqCj4+ICsgKiBz
dHJ1Y3QgdWFjY2VfcWZpbGVfcmVnaW9uIC0gc3RydWN0dXJlIG9mIHF1ZXVlIGZpbGUgcmVnaW9u
Cj4+ICsgKiBAdHlwZTogdHlwZSBvZiB0aGUgcWZyCj4+ICsgKiBAZmxhZ3M6IGZsYWdzIG9mIHFm
cgo+PiArICogQHByb3Q6IHFmciBwcm90ZWN0aW9uIGZsYWcKPj4gKyAqLwo+PiArc3RydWN0IHVh
Y2NlX3FmaWxlX3JlZ2lvbiB7Cj4+ICsJZW51bSB1YWNjZV9xZnJ0IHR5cGU7Cj4+ICsJZW51bSB1
YWNjZV9xZnJfZmxhZyBmbGFnczsKPj4gKwl1MzIgcHJvdDsKPj4gK307Cj4+ICsKPj4gKy8qKgo+
PiArICogc3RydWN0IHVhY2NlX29wcyAtIHVhY2NlIGRldmljZSBvcGVyYXRpb25zCj4+ICsgKiBA
Z2V0X2F2YWlsYWJsZV9pbnN0YW5jZXM6ICBnZXQgYXZhaWxhYmxlIGluc3RhbmNlcyBsZWZ0IG9m
IHRoZSBkZXZpY2UKPj4gKyAqIEBnZXRfcXVldWU6IGdldCBhIHF1ZXVlIGZyb20gdGhlIGRldmlj
ZQo+PiArICogQHB1dF9xdWV1ZTogZnJlZSBhIHF1ZXVlIHRvIHRoZSBkZXZpY2UKPj4gKyAqIEBz
dGFydF9xdWV1ZTogbWFrZSB0aGUgcXVldWUgc3RhcnQgd29yayBhZnRlciBnZXRfcXVldWUKPj4g
KyAqIEBzdG9wX3F1ZXVlOiBtYWtlIHRoZSBxdWV1ZSBzdG9wIHdvcmsgYmVmb3JlIHB1dF9xdWV1
ZQo+PiArICogQGlzX3FfdXBkYXRlZDogY2hlY2sgd2hldGhlciB0aGUgdGFzayBpcyBmaW5pc2hl
ZAo+PiArICogQG1hc2tfbm90aWZ5OiBtYXNrIHRoZSB0YXNrIGlycSBvZiBxdWV1ZQo+PiArICog
QG1tYXA6IG1tYXAgYWRkcmVzc2VzIG9mIHF1ZXVlIHRvIHVzZXIgc3BhY2UKPj4gKyAqIEByZXNl
dDogcmVzZXQgdGhlIHVhY2NlIGRldmljZQo+PiArICogQHJlc2V0X3F1ZXVlOiByZXNldCB0aGUg
cXVldWUKPj4gKyAqIEBpb2N0bDogaW9jdGwgZm9yIHVzZXIgc3BhY2UgdXNlcnMgb2YgdGhlIHF1
ZXVlCj4+ICsgKi8KPj4gK3N0cnVjdCB1YWNjZV9vcHMgewo+PiArCWludCAoKmdldF9hdmFpbGFi
bGVfaW5zdGFuY2VzKShzdHJ1Y3QgdWFjY2VfZGV2aWNlICp1YWNjZSk7Cj4+ICsJaW50ICgqZ2V0
X3F1ZXVlKShzdHJ1Y3QgdWFjY2VfZGV2aWNlICp1YWNjZSwgdW5zaWduZWQgbG9uZyBhcmcsCj4+
ICsJCQkgc3RydWN0IHVhY2NlX3F1ZXVlICpxKTsKPj4gKwl2b2lkICgqcHV0X3F1ZXVlKShzdHJ1
Y3QgdWFjY2VfcXVldWUgKnEpOwo+PiArCWludCAoKnN0YXJ0X3F1ZXVlKShzdHJ1Y3QgdWFjY2Vf
cXVldWUgKnEpOwo+PiArCXZvaWQgKCpzdG9wX3F1ZXVlKShzdHJ1Y3QgdWFjY2VfcXVldWUgKnEp
Owo+PiArCWludCAoKmlzX3FfdXBkYXRlZCkoc3RydWN0IHVhY2NlX3F1ZXVlICpxKTsKPj4gKwl2
b2lkICgqbWFza19ub3RpZnkpKHN0cnVjdCB1YWNjZV9xdWV1ZSAqcSwgaW50IGV2ZW50X21hc2sp
Owo+PiArCWludCAoKm1tYXApKHN0cnVjdCB1YWNjZV9xdWV1ZSAqcSwgc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsCj4+ICsJCSAgICBzdHJ1Y3QgdWFjY2VfcWZpbGVfcmVnaW9uICpxZnIpOwo+
PiArCWludCAoKnJlc2V0KShzdHJ1Y3QgdWFjY2VfZGV2aWNlICp1YWNjZSk7Cj4+ICsJaW50ICgq
cmVzZXRfcXVldWUpKHN0cnVjdCB1YWNjZV9xdWV1ZSAqcSk7Cj4gU29tZSBvZiB0aGVzZSBhcmVu
J3QgdXNlZCBvbiBvbmx5IGV4aXN0aW5nIGRyaXZlci4gIEludHJvZHVjZSB0aGVtIG9ubHkKPiBp
biB0aGUgc2VyaWVzIHRoYXQgdXNlcyB0aGVtLgpPSwo+Cj4+ICsJbG9uZyAoKmlvY3RsKShzdHJ1
Y3QgdWFjY2VfcXVldWUgKnEsIHVuc2lnbmVkIGludCBjbWQsCj4+ICsJCSAgICAgIHVuc2lnbmVk
IGxvbmcgYXJnKTsKPj4gK307Cj4+ICsKPj4gKy8qKgo+PiArICogc3RydWN0IHVhY2NlX2ludGVy
ZmFjZQo+IEkgdGhpbmsgdGhpcyBuZWVkcyBhIGRlc2NyaXB0aW9uIGZvciBrZXJuZWwgZG9jIChl
dmVuIGlmIGl0J3Mgb2J2aW91cyEpCj4gQ291bGQgYmUgd3JvbmcgdGhvdWdoLgpPSwo+Cj4+ICsg
KiBAbmFtZTogdGhlIHVhY2NlIGRldmljZSBuYW1lLiAgV2lsbCBzaG93IHVwIGluIHN5c2ZzCj4+
ICsgKiBAZmxhZ3M6IHVhY2NlIGRldmljZSBhdHRyaWJ1dGVzCj4+ICsgKiBAb3BzOiBwb2ludGVy
IHRvIHRoZSBzdHJ1Y3QgdWFjY2Vfb3BzCj4+ICsgKgo+PiArICogVGhpcyBzdHJ1Y3R1cmUgaXMg
dXNlZCBmb3IgdGhlIHVhY2NlX3JlZ2lzdGVyKCkKPj4gKyAqLwo+PiArc3RydWN0IHVhY2NlX2lu
dGVyZmFjZSB7Cj4+ICsJY2hhciBuYW1lW1VBQ0NFX01BWF9OQU1FX1NJWkVdOwo+PiArCWVudW0g
dWFjY2VfZGV2X2ZsYWcgZmxhZ3M7Cj4+ICsJc3RydWN0IHVhY2NlX29wcyAqb3BzOwo+PiArfTsK
Pj4gKwo+PiArZW51bSB1YWNjZV9xX3N0YXRlIHsKPj4gKwlVQUNDRV9RX0lOSVQsCj4+ICsJVUFD
Q0VfUV9TVEFSVEVELAo+PiArCVVBQ0NFX1FfWk9NQklFLAo+PiArfTsKPj4gKwo+PiArLyoqCj4+
ICsgKiBzdHJ1Y3QgdWFjY2VfcXVldWUKPj4gKyAqIEB1YWNjZTogcG9pbnRlciB0byB1YWNjZQo+
PiArICogQHByaXY6IHByaXZhdGUgcG9pbnRlcgo+PiArICogQHdhaXQ6IHdhaXQgcXVldWUgaGVh
ZAo+PiArICogQHBhc2lkOiBwYXNpZCBvZiB0aGUgcXVldWUKPj4gKyAqIEBwaWQ6IHBpZCBvZiB0
aGUgcHJvY2VzcyB1c2luZyB0aGUgcXVldWUKPj4gKyAqIEBoYW5kbGU6IGlvbW11X3N2YSBoYW5k
bGUgcmV0dXJuIGZyb20gaW9tbXVfc3ZhX2JpbmRfZGV2aWNlCj4+ICsgKiBAbGlzdDogcXVldWUg
bGlzdAo+PiArICogQHFmcnM6IHBvaW50ZXIgb2YgcWZyIHJlZ2lvbnMKPj4gKyAqIEBzdGF0ZTog
cXVldWUgc3RhdGUgbWFjaGluZQo+PiArICovCj4+ICtzdHJ1Y3QgdWFjY2VfcXVldWUgewo+PiAr
CXN0cnVjdCB1YWNjZV9kZXZpY2UgKnVhY2NlOwo+PiArCXZvaWQgKnByaXY7Cj4+ICsJd2FpdF9x
dWV1ZV9oZWFkX3Qgd2FpdDsKPj4gKwlpbnQgcGFzaWQ7Cj4+ICsJcGlkX3QgcGlkOwo+PiArCXN0
cnVjdCBpb21tdV9zdmEgKmhhbmRsZTsKPj4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4+ICsJ
c3RydWN0IHVhY2NlX3FmaWxlX3JlZ2lvbiAqcWZyc1tVQUNDRV9RRlJUX01BWF07Cj4+ICsJZW51
bSB1YWNjZV9xX3N0YXRlIHN0YXRlOwo+PiArfTsKPj4gKwo+PiArLyoqCj4+ICsgKiBzdHJ1Y3Qg
dWFjY2VfZGV2aWNlCj4+ICsgKiBAYWxnczogc3VwcG9ydGVkIGFsZ29yaXRobXMKPj4gKyAqIEBh
cGlfdmVyOiBhcGkgdmVyc2lvbgo+PiArICogQHFmX3BnX3NpemU6IHBhZ2Ugc2l6ZSBvZiB0aGUg
cXVldWUgZmlsZSByZWdpb25zCj4+ICsgKiBAb3BzOiBwb2ludGVyIHRvIHRoZSBzdHJ1Y3QgdWFj
Y2Vfb3BzCj4+ICsgKiBAcGRldjogcG9pbnRlciB0byB0aGUgcGFyZW50IGRldmljZQo+PiArICog
QGlzX3ZmOiB3aGV0aGVyIHZpcnR1YWwgZnVuY3Rpb24KPj4gKyAqIEBmbGFnczogdWFjY2UgYXR0
cmlidXRlcwo+PiArICogQGRldl9pZDogaWQgb2YgdGhlIHVhY2NlIGRldmljZQo+PiArICogQHBy
b3Q6IHVhY2NlIHByb3RlY3Rpb24gZmxhZwo+PiArICogQGNkZXY6IGNkZXYgb2YgdGhlIHVhY2Nl
Cj4+ICsgKiBAZGV2OiBkZXYgb2YgdGhlIHVhY2NlCj4+ICsgKiBAcHJpdjogcHJpdmF0ZSBwb2lu
dGVyIG9mIHRoZSB1YWNjZQo+PiArICogQHFzOiBsaXN0IGhlYWQgb2YgcXVldWUtPmxpc3QKPj4g
KyAqIEBxX2xvY2s6IGxvY2sgZm9yIHFzCj4+ICsgKi8KPj4gK3N0cnVjdCB1YWNjZV9kZXZpY2Ug
ewo+PiArCWNvbnN0IGNoYXIgKmFsZ3M7Cj4+ICsJY29uc3QgY2hhciAqYXBpX3ZlcjsKPj4gKwl1
bnNpZ25lZCBsb25nIHFmX3BnX3NpemVbVUFDQ0VfUUZSVF9NQVhdOwo+PiArCXN0cnVjdCB1YWNj
ZV9vcHMgKm9wczsKPiBDYW4gd2UgbWFrZSB0aGlzIG9wcyBzdHJ1Y3R1cmUgYSBwb2ludCB0byBh
IGNvbnN0YW50IHN0cnVjdD8KPiBJJ20gZ3Vlc3NpbmcgaXQnbGwgYmUgZml4ZWQgZm9yIGEgZ2l2
ZW4gZHJpdmVyLgpPSwo+Cj4+ICsJc3RydWN0IGRldmljZSAqcGRldjsKPiBQZXJoYXBzIGp1c3Qg
Y2FsbCBpdCBwYXJlbnQuIHBkZXYgd2lsbCBiZSBjb25mdXNpbmcgd2l0aAo+IHBjaSBkZXZpY2Vz
LgpPSwo+Cj4+ICsJYm9vbCBpc192ZjsKPj4gKwl1MzIgZmxhZ3M7Cj4+ICsJdTMyIGRldl9pZDsK
Pj4gKwl1MzIgcHJvdDsKPj4gKwlzdHJ1Y3QgY2RldiAqY2RldjsKPiBDYW4gd2UgZW1iZWQgdGhl
IGNkZXYgc3RydWN0dXJlIHJhdGhlciB0aGFuIHVzZSBhIHBvaW50ZXIKPiBhbmQgc2VwYXJhdGUg
YWxsb2NhdGlvbj8KTk8sIHdlIGNhbid0LgpXZSBvcmlnaW5hbGx5IGVtYmVkIHRoZSBjZGV2IHN0
cnVjdHVyZSwgYW5kIEdyZWcgcmVtaW5kZWQgdXMgdGhlc2UgdHdvIApzdHJ1Y3R1cmUgaGF2ZSBk
aWZmZXJlbnQgbGlmZXRpbWUuCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzgvMjgvNzcxCj4+
ICsJc3RydWN0IGRldmljZSBkZXY7Cj4+ICsJdm9pZCAqcHJpdjsKPj4gKwlzdHJ1Y3QgbGlzdF9o
ZWFkIHFzOwo+PiArCXN0cnVjdCBtdXRleCBxX2xvY2s7Cj4+ICt9Owo+PiArCj4+ICsjaWYgSVNf
RU5BQkxFRChDT05GSUdfVUFDQ0UpCj4+ICsKPj4gK3N0cnVjdCB1YWNjZV9kZXZpY2UgKnVhY2Nl
X3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwKPj4gKwkJCQkgICAgc3RydWN0IHVhY2Nl
X2ludGVyZmFjZSAqaW50ZXJmYWNlKTsKPj4gK3ZvaWQgdWFjY2VfdW5yZWdpc3RlcihzdHJ1Y3Qg
dWFjY2VfZGV2aWNlICp1YWNjZSk7Cj4+ICsKPj4gKyNlbHNlIC8qIENPTkZJR19VQUNDRSAqLwo+
PiArCj4+ICtzdGF0aWMgaW5saW5lCj4+ICtzdHJ1Y3QgdWFjY2VfZGV2aWNlICp1YWNjZV9yZWdp
c3RlcihzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsCj4+ICsJCQkJICAgIHN0cnVjdCB1YWNjZV9pbnRl
cmZhY2UgKmludGVyZmFjZSkKPj4gK3sKPj4gKwlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPj4g
K30KPj4gKwo+PiArc3RhdGljIGlubGluZSB2b2lkIHVhY2NlX3VucmVnaXN0ZXIoc3RydWN0IHVh
Y2NlX2RldmljZSAqdWFjY2UpIHt9Cj4+ICsKPj4gKyNlbmRpZiAvKiBDT05GSUdfVUFDQ0UgKi8K
Pj4gKwo+PiArI2VuZGlmIC8qIF9MSU5VWF9VQUNDRV9IICovCj4+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbWlzYy91YWNjZS91YWNjZS5oIGIvaW5jbHVkZS91YXBpL21pc2MvdWFjY2UvdWFj
Y2UuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwLi5hNGY5Mzc4Cj4+
IC0tLSAvZGV2L251bGwKPj4gKysrIGIvaW5jbHVkZS91YXBpL21pc2MvdWFjY2UvdWFjY2UuaAo+
PiBAQCAtMCwwICsxLDM4IEBACj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MCsgV0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KPj4gKyNpZm5kZWYgX1VBUElVVUFDQ0VfSAo+
PiArI2RlZmluZSBfVUFQSVVVQUNDRV9ICj4+ICsKPj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5o
Pgo+PiArI2luY2x1ZGUgPGxpbnV4L2lvY3RsLmg+Cj4+ICsKPj4gKy8qIFVBQ0NFX0NNRF9TVEFS
VF9ROiBTdGFydCB0aGUgcXVldWUgKi8KPj4gKyNkZWZpbmUgVUFDQ0VfQ01EX1NUQVJUX1EJX0lP
KCdXJywgMCkKPj4gKwo+PiArLyoqCj4+ICsgKiBVQUNDRV9DTURfUFVUX1E6Cj4+ICsgKiBVc2Vy
IGFjdGl2ZWx5IHN0b3AgcXVldWUgYW5kIGZyZWUgcXVldWUgcmVzb3VyY2UgaW1tZWRpYXRlbHkK
Pj4gKyAqIE9wdGltaXphdGlvbiBtZXRob2Qgc2luY2UgY2xvc2UgZmQgbWF5IGRlbGF5Cj4+ICsg
Ki8KPj4gKyNkZWZpbmUgVUFDQ0VfQ01EX1BVVF9RCQlfSU8oJ1cnLCAxKQo+PiArCj4+ICsvKioK
Pj4gKyAqIGVudW0gdWFjY2VfZGV2X2ZsYWc6IERldmljZSBmbGFnczoKPj4gKyAqIEBVQUNDRV9E
RVZfU1ZBOiBTaGFyZWQgVmlydHVhbCBBZGRyZXNzZXMKPj4gKyAqCQkgICBTdXBwb3J0IFBBU0lE
Cj4+ICsgKgkJICAgU3VwcG9ydCBkZXZpY2UgcGFnZSBmYXVsdHMgKFBDSSBQUkkgb3IgU01NVSBT
dGFsbCkKPj4gKyAqLwo+PiArZW51bSB1YWNjZV9kZXZfZmxhZyB7Cj4+ICsJVUFDQ0VfREVWX1NW
QSA9IEJJVCgwKSwKPiBBcyBtZW50aW9uZWQgaW4gZG9jcyByZXZpZXcsIHRoaXMgZG9lc24ndCBs
b29rIGxpa2UgYW4gZW51bSB0byBtZS4KPiBKdXN0IHVzZSAjZGVmaW5lIGZvciB0aGUgYml0IGFu
ZCBhIHN1aXRhYmxlIHNpemVkIGludGVnZXIgZm9yIGFueQo+IGNhbGxzIHVzaW5nIGl0LgpPSywg
YnV0IHRoZXJlIGFyZSBzdGlsbCBtb3JlIGZlYXR1cmVzIGluIHRoZSBmdXR1cmUgcGF0Y2guCgpU
aGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlv
bW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
