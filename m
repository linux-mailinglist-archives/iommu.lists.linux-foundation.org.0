Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 90263E7C8D
	for <lists.iommu@lfdr.de>; Mon, 28 Oct 2019 23:52:03 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6FEFDE80;
	Mon, 28 Oct 2019 22:51:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 302DDC6C
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 22:51:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 0BEA442D
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 22:51:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C8621F1;
	Mon, 28 Oct 2019 15:51:56 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 324343F6C4;
	Mon, 28 Oct 2019 15:51:55 -0700 (PDT)
Subject: Re: [PATCH v2] iommu/arm-smmu: fix "hang" when games exit
To: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
	<20191007204906.19571-1-robdclark@gmail.com>
	<20191028222042.GB8532@willie-the-truck>
	<CAJs_Fx7zRWsTPiAg0PFt+8nJPpHpzSkxW6XMMJwozVO6vyB78A@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e3fc88d9-4934-0227-d9c7-b1cb37a8811e@arm.com>
Date: Mon, 28 Oct 2019 22:51:53 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAJs_Fx7zRWsTPiAg0PFt+8nJPpHpzSkxW6XMMJwozVO6vyB78A@mail.gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: open list <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
	freedreno <freedreno@lists.freedesktop.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
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

On 2019-10-28 10:38 pm, Rob Clark wrote:
> On Mon, Oct 28, 2019 at 3:20 PM Will Deacon <will@kernel.org> wrote:
>>
>> Hi Rob,
>>
>> On Mon, Oct 07, 2019 at 01:49:06PM -0700, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> When games, browser, or anything using a lot of GPU buffers exits, there
>>> can be many hundreds or thousands of buffers to unmap and free.  If the
>>> GPU is otherwise suspended, this can cause arm-smmu to resume/suspend
>>> for each buffer, resulting 5-10 seconds worth of reprogramming the
>>> context bank (arm_smmu_write_context_bank()/arm_smmu_write_s2cr()/etc).
>>> To the user it would appear that the system just locked up.
>>>
>>> A simple solution is to use pm_runtime_put_autosuspend() instead, so we
>>> don't immediately suspend the SMMU device.
>>
>> Please can you reword the subject to be a bit more useful? The commit
>> message is great, but the subject is a bit like "fix bug in code" to me.
> 
> yeah, not the best $subject, but I wasn't quite sure how to fit
> something better in a reasonable # of chars.. maybe something like:
> "iommu/arm-smmu: optimize unmap but avoiding toggling runpm state"?

FWIW, I'd be inclined to frame it as something like "avoid pathological 
RPM behaviour for unmaps".

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
