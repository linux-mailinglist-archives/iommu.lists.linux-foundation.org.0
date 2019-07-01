Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D17164A558
	for <lists.iommu@lfdr.de>; Tue, 18 Jun 2019 17:28:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E96F4C7D;
	Tue, 18 Jun 2019 15:28:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F16B5B8E
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 15:28:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B98EB2C3
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 15:28:36 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
	[24.9.64.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 031B92085A;
	Tue, 18 Jun 2019 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560871716;
	bh=cBZbIGQ+cjyD2YCVRDOXcoe7z6QzrPpzbzN0znS/Ylg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=1637osodxbXA+dd8NcCz7z4PZoJd2L4ooz5xgXaHLyVoXzk6mzzxCFsnF70fvSYaj
	rxwiYsehj0Nwqj96sUhbw7/ewZ6peonITYgoV53cZ0Lc/Fz3dnxXt5nuaECF1D648A
	wRwkpNFXQQ0FTiqYqUEkbxk32ximtj+bSI7AepPk=
Subject: Re: How to resolve an issue in swiotlb environment?
To: Alan Stern <stern@rowland.harvard.edu>
References: <Pine.LNX.4.44L0.1906141043530.24571-100000@netrider.rowland.org>
From: shuah <shuah@kernel.org>
Message-ID: <20684ef6-7da7-90ed-4cd6-3bc46202de6d@kernel.org>
Date: Tue, 18 Jun 2019 09:28:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1906141043530.24571-100000@netrider.rowland.org>
Content-Language: en-US
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 6/14/19 8:44 AM, Alan Stern wrote:
> On Thu, 13 Jun 2019, shuah wrote:
> 
>>> Great!  So all we have to do is fix vhci-hcd.  Then we can remove all
>>> the virt_boundary_mask stuff from usb-storage and uas entirely.
>>>
>>> (I'm assuming wireless USB isn't a genuine issue.  As far as I know, it
>>> is pretty much abandoned at this point.)
>>>
>>> Valentina and Shua: Adding SG support to vhci-hcd shouldn't be too
>>> hard.  It ought to be possible even without changing the network
>>> protocol.
>>>
>>
>> I will start taking a look at this. Is there a target release in plan
>> to drop virt_boundary_mask stuff?
> 
> Not yet.  But since it doesn't do what we want anyway, this should be
> fixed quickly.
> 

Sounds good. I am working on it.

thanks,
-- Shuah
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
