Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20F103B9
	for <lists.iommu@lfdr.de>; Wed,  1 May 2019 03:42:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BF04025D1;
	Wed,  1 May 2019 01:42:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5190C25DB
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 01:42:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 13AE270D
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 01:41:58 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id k189so9518184qkc.0
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 18:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VzGKxXFfllxyPKqLe/F+e5VHkssK7p8Vb80iGpJgCFA=;
	b=ZR2GyJS5dWX7nLKzsIONL3xnxWag/CPBF5z5Q3WK4lqkd0uuprDeD/PvnrPHd+4U94
	wj8wxPBjQvKSHa8bKLP0YPQa22v6D5IK1Qk+OWvF6LZyVxs/f24ikLRRuo5C6b6qV8WP
	Yj2z8dNAXONHRRn4vANpEqSjjdF9+LD8Si+kulNXhWlDfWXzGilwpom0mW20Qqy0QlKP
	VI+psISXQUlkSuzu/k2MY5KWwQ+PjXvlvIz3cfcEhkfxa8QQrCyKfFndwTrjxkfCEE/o
	YX9uFd30PbyKcPfP8d2HNblJjkx21LkGIDuTLbGqG80QkBVF107m8/u/keL3bz/L1XB6
	LXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VzGKxXFfllxyPKqLe/F+e5VHkssK7p8Vb80iGpJgCFA=;
	b=d1FGVr7NP518V/MIvEBrGhD/G+QTZ2xE0L/PCt7cF6YTQp6qRcoKjsv6B8S3Ywsmdi
	Xe3IVi2pl1tA/1FZbeLjxCEyR8cjf6siXRyZaZjhIJlYDLEuXVtAoYL8ilwP5wFbCOjh
	fmA73vkl3jnDv+2RUTMsG4AK5GpokYmErL6ETbcy4ngbYPSfmll9HgaodFZXp1hql0oB
	YrMdmsrXtUNAtOU3Z2Gr3WVpyQMf71PIORV4JdTgmT5iPa1y7w8l3C6c144/mvlJbMdN
	ssL3O+WSDTCYzvKth6OQ1j/eWRq4qkzXtQ0bhUZdHvDq2Jb98HJB260AANI6Cwsu1y0B
	97+Q==
X-Gm-Message-State: APjAAAVMmqDDc9Q0U7XhGFZJRaYuXN1OAWVnopyLmOm8lZWKJh5i4F6k
	ViPmfVCKdgBWmpmTsj26q3WgIw==
X-Google-Smtp-Source: APXvYqxDJRW8H1a19W7cRgf2FHPg/okPqiJ0Vj9a0lEZHAKZo54gr9gYUOu23p/8BJzgO3lcoC4zIA==
X-Received: by 2002:a37:5042:: with SMTP id e63mr52290993qkb.240.1556674918195;
	Tue, 30 Apr 2019 18:41:58 -0700 (PDT)
Received: from ovpn-121-162.rdu2.redhat.com
	(pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
	by smtp.gmail.com with ESMTPSA id
	m60sm20587636qte.81.2019.04.30.18.41.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 18:41:57 -0700 (PDT)
Subject: Re: "iommu/amd: Set exclusion range correctly" causes smartpqi offline
To: Joerg Roedel <jroedel@suse.de>
References: <1556290348.6132.6.camel@lca.pw> <20190426152632.GC3173@suse.de>
	<1556294112.6132.7.camel@lca.pw> <20190429142326.GA4678@suse.de>
From: Qian Cai <cai@lca.pw>
Message-ID: <61d3a8d6-48b0-0ec4-82e0-10c67ad9dcd7@lca.pw>
Date: Tue, 30 Apr 2019 21:41:56 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429142326.GA4678@suse.de>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org



On 4/29/19 10:23 AM, Joerg Roedel wrote:
> On Fri, Apr 26, 2019 at 11:55:12AM -0400, Qian Cai wrote:
>> https://git.sr.ht/~cai/linux-debug/blob/master/dmesg
> 
> Thanks, I can't see any definitions for unity ranges or exclusion ranges
> in the IVRS table dump, which makes it even more weird.
> 
> Can you please send me the output of
> 
> 	for f in `ls -1 /sys/kernel/iommu_groups/*/reserved_regions`; do echo "---$f"; cat $f;done
> 
> to double-check?

It is going to take a while to reserve that system again to gather the
information. BTW, this is only reproducible on linux-next but not mainline.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
